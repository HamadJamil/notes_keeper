import 'package:flutter/material.dart';
import 'package:notes_keeper/data/local/database_helper.dart';

class DataBaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DataBaseProvider({required this.databaseHelper});

  List<Map<String, dynamic>> _noteList = [];

  List<Map<String, dynamic>> get noteList => _noteList;

  setNotesList() async {
    _noteList = await databaseHelper.getNotes;
    notifyListeners();
  }

  void addNote({required String title, required String description}) {
    databaseHelper.addNote(title: title, description: description);
    setNotesList();
  }

  void updateNote({
    required int id,
    required String title,
    required String description,
  }) {
    databaseHelper.updateNote(id: id, title: title, description: description);
    setNotesList();
  }

  void deleteNote({required int id}) {
    databaseHelper.deleteNote(id: id);
    setNotesList();
  }
}
