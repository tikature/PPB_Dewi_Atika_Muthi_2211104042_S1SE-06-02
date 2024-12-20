import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/note_model.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;

  void addNote(String title, String description) {
    notes.add(Note(title: title, description: description));
    Get.back();

    Get.snackbar(
      'Berhasil', // title
      'Catatan "$title" telah ditambahkan',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 4),
    );
  }

  void deleteNote(int index) {
    final deletedNote = notes[index];
    notes.removeAt(index);

    Get.snackbar(
      'Berhasil',
      'Catatan "${deletedNote.title}" telah dihapus',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 4),
    );
  }
}
