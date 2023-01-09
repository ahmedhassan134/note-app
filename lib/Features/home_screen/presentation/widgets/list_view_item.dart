import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';

import '../../../../cubites/display_notes/displaynotes_cubit.dart';
import '../../../edit_note/presentation/view/note_view.dart';
class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key,required this.notes}) : super(key: key);
final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  EditNoteView(
            note: notes,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(notes.color)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            ListTile(
              title: Text(notes.title),
              subtitle:  Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(notes.subTitle),
              ),
              trailing:  IconButton(
                onPressed:(){
                  notes.delete();
                  BlocProvider.of<DisplaynotesCubit>(context).fetchData();
                },
                icon: const Icon(Icons.delete),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 15),
              child: Text(notes.date),
            )
          ],
        ),
      ),
    );
  }
}
