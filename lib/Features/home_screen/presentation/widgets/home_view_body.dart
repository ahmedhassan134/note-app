import 'package:flutter/material.dart';

import 'custom_appbar_widget.dart';
import 'custom_note_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
        child: Column(
          children:  [
            CustomAppBarWidget(
              title: 'Notes',
              onPressed: (){
                //
                //  Hive.box(kBoxNotes).clear();
                // // Hive.deleteBoxFromDisk(kBoxNotes);
                // BlocProvider.of<DisplaynotesCubit>(context).fetchData();
                

              },
              icon: Icons.delete,
            ),
            const NoteAppItem(),
          ],
        ),
      );
  }
}

