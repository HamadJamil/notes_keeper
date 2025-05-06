import 'package:flutter/material.dart';
import 'package:notes_keeper/components/custom_tile.dart';
import 'package:notes_keeper/data/database_constants/table_notes.dart';
import 'package:notes_keeper/note_screen.dart';
import 'package:notes_keeper/note_view.dart';
import 'package:notes_keeper/provider/data_base_provider.dart';
import 'package:notes_keeper/provider/theme_provider.dart';
import 'package:notes_keeper/services/snack_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataBaseProvider>(context, listen: false).setNotesList();
    Provider.of<ThemeProvider>(context, listen: false).loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes Keeper'),
        actions: [
          Switch.adaptive(
            value: context.watch<ThemeProvider>().isDarkTheme(),
            onChanged: (value) {
              context.read<ThemeProvider>().updateTheme(value: value);
            },
            thumbColor: WidgetStateProperty.all(
              context.watch<ThemeProvider>().isDarkTheme()
                  ? Colors.black
                  : Colors.white,
            ),
            inactiveThumbColor: Colors.white,
            thumbIcon: WidgetStateProperty.all(Icon(Icons.light_mode)),
          ),
        ],
      ),
      body: Consumer<DataBaseProvider>(
        builder: (ctx, provider, _) {
          List<Map<String, dynamic>> notesList =
              context.watch<DataBaseProvider>().noteList.reversed.toList();
          return notesList.isEmpty
              ? Center(child: Text('No Notes Created yet!'))
              : ListView.builder(
                itemCount: notesList.length,
                itemBuilder:
                    (context, index) => CustomTile(
                      id: notesList[index][columnSerialNumber],
                      title: notesList[index][columnTitle],
                      description: notesList[index][columnDescription],
                      createdDate: notesList[index][columnCreatedDate],
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => NoteView(note: notesList[index]),
                          ),
                        );
                      },
                      onLongPress: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (_) => NoteScreen(
                                  isUpdate: true,
                                  note: notesList[index],
                                ),
                          ),
                        );
                      },
                      onDismissed: () {
                        final deletedNote = notesList[index];
                        final dbProvider = context.read<DataBaseProvider>();

                        dbProvider.deleteNote(
                          id: deletedNote[columnSerialNumber],
                        );

                        SnackService.showSnackBar(
                          message: 'Note Deleted',
                          context: context,
                          isDelete: true,
                          onUndo: () {
                            // Use the saved provider reference, not context.read()
                            dbProvider.addNote(
                              title: deletedNote[columnTitle],
                              description: deletedNote[columnDescription],
                            );
                          },
                        );
                      },
                    ),
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => NoteScreen(isUpdate: false)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
