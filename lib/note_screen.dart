import 'package:flutter/material.dart';
import 'package:notes_keeper/components/custom_button.dart';
import 'package:notes_keeper/components/custom_text_field.dart';
import 'package:notes_keeper/data/database_constants/table_notes.dart';
import 'package:notes_keeper/provider/data_base_provider.dart';
import 'package:notes_keeper/services/snack_service.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key, this.note, bool? isUpdate})
    : isUpdate = isUpdate ?? false;
  final bool isUpdate;
  final Map<String, dynamic>? note;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      titleController.text = widget.note![columnTitle];
      descriptionController.text = widget.note![columnDescription];
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isUpdate ? 'Update note' : 'Add Note'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 25, right: 25),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(label: 'Title', controller: titleController),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Description',
                controller: descriptionController,
                maxLines: 5,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.isUpdate
                              ? context.read<DataBaseProvider>().updateNote(
                                id: widget.note![columnSerialNumber],
                                title: titleController.text,
                                description: descriptionController.text,
                              )
                              : context.read<DataBaseProvider>().addNote(
                                title: titleController.text,
                                description: descriptionController.text,
                              );
                          Navigator.pop(context);
                          SnackService.showSnackBar(
                            message:
                                widget.isUpdate
                                    ? 'Note updated successfully'
                                    : 'Note added successfully',
                            context: context,
                          );
                        }
                      },
                      text: widget.isUpdate ? 'Update' : 'Add',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Cancel',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
