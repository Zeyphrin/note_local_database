import 'package:get/get.dart';
import 'package:note_local_database/db/db_helper.dart';
import 'package:note_local_database/models/note.dart';
import 'package:sqflite/sqflite.dart';

class HomePageController extends GetxController {
  Database db = DbHelper.getDb();

  RxBool isLoading = false.obs;
  late List<Note> notes;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    List<Map<String, dynamic>> mapNotes = await db.query("Notes");
    notes = mapNotes.map((e) => Note.fromMap(map: e)).toList();
    isLoading.value = false;
  }

  void createNote() async {
    var newNotes = await Get.toNamed("/create");
    newNotes = newNotes as Note?;
    if (newNotes != null) {
      await db.insert("Notes", newNotes.toMap());
      getNotes();
    }
  }

  void deleteNotes(int id) async {
    db.delete("Notes", where: "id = ?", whereArgs: [id]);
    getNotes();
  }
}