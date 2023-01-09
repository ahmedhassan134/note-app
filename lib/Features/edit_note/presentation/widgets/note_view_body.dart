import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Features/home_screen/presentation/widgets/text_field_widget.dart';
import 'package:note_app/models/note_model.dart';

import '../../../../cubites/display_notes/displaynotes_cubit.dart';
import '../../../home_screen/presentation/widgets/custom_appbar_widget.dart';
class  EditViewBody extends StatefulWidget {
  const EditViewBody({Key? key,required this.note}) : super(key: key);
final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
String ? title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
      child: Column(
        children:  [

          CustomAppBarWidget(
            title: 'Edit Notes',
            icon: Icons.check,
            onPressed: (){
              widget.note.title=title??widget.note.title;
              widget.note.subTitle=subTitle??widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<DisplaynotesCubit>(context).fetchData();
              Navigator.pop(context);

            },
          ),
          const SizedBox(height: 20,),
          TextFieldWidget(hintText: widget.note.title,
          onChanged:(value){
            title=value;
          } ),
          const SizedBox(height: 10,),
          TextFieldWidget(hintText: widget.note.subTitle,maxLines: 5,

          onChanged: (value){
            subTitle=value;
          },)

        ],
      ),
    );
  }
}
