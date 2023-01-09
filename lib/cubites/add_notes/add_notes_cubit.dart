import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

import '../../constant/strings.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  Color color= Color(0xff3D1766);
  addNotes(NoteModel notes) async {

    notes.color=color.value;
    emit(AddNotesLoading());
    try {
      var box = Hive.box<NoteModel>(kBoxNotes);
      await box.add(notes);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(e.toString()));
    }
  }
}
