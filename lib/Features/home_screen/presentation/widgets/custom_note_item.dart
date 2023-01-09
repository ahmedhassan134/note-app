import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubites/display_notes/displaynotes_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'list_view_item.dart';

class NoteAppItem extends StatelessWidget {
  const NoteAppItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplaynotesCubit, DisplayNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<DisplaynotesCubit>(context).notes ?? [];
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return  ListViewItem(
                notes: notes[index],
              );
            },
          ),
        );
      },
    );
  }
}
