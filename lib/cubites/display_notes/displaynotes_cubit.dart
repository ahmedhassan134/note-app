import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../constant/strings.dart';
import '../../models/note_model.dart';

part 'displaynotes_state.dart';

class DisplaynotesCubit extends Cubit<DisplayNotesState> {
  DisplaynotesCubit() : super(DisplayNotesInitial());

  List<NoteModel>? notes;

  fetchData(){


      var box=Hive.box<NoteModel>(kBoxNotes);
      notes=box.values.toList();
emit(SuccessDisplayData());


  }
}
