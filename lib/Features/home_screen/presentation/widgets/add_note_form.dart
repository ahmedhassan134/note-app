import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Features/home_screen/presentation/widgets/text_field_widget.dart';
import 'package:note_app/cubites/add_notes/add_notes_cubit.dart';
import 'package:note_app/cubites/display_notes/displaynotes_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'custom_bottom.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          TextFieldWidget(
            onSaved: (value) {
              title = value;
            },
            hintText: "Title",
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            hintText: "Content",
            maxLines: 6,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          ListBuildItem(),
          const Spacer(),
          CustomBottom(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                DateTime now = DateTime.now();
                String formattedDate = DateFormat('yyyy-MM-dd ').format(now);
                NoteModel notes = NoteModel(title: title!,
                    subTitle: subTitle!,
                    date:formattedDate ,
                    color: Colors.blue.value);

                    BlocProvider.of<AddNotesCubit>(context).addNotes(notes);
                    BlocProvider.of<DisplaynotesCubit>(context).fetchData();
              } else {

              autovalidateMode = AutovalidateMode.always;
              setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.colorItem, required this.isChoosen}) : super(key: key);
final Color colorItem;
final bool isChoosen;
  @override
  Widget build(BuildContext context) {
    return isChoosen? Container(
      width: 60,
      height: 60,
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        
      ),
      child: CircleAvatar(
        radius: 34,
        backgroundColor: colorItem,
      ),
    ):CircleAvatar(
      radius: 34,
      backgroundColor: colorItem,
    );
  }
}
class ListBuildItem extends StatefulWidget {
  ListBuildItem({Key? key}) : super(key: key);

  @override
  State<ListBuildItem> createState() => _ListBuildItemState();
}

class _ListBuildItemState extends State<ListBuildItem> {
 final List<Color> colors=[
    Color(0xff3D1766),
    Color(0xff6F1AB6),
    Color(0xffFF0032),
    Color(0xffCD0404),
    Color(0xff39B5E0),
    Color(0xffA31ACB),
    Color(0xffFF78F0),
    Color(0xffF5EA5A),


  ];

 int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 38,
      child: ListView.builder
        (
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
          itemBuilder: (context,index){

        return  Padding(
         padding: EdgeInsets.only(top: 15,left: 4),
          child: GestureDetector(
            onTap: (){
              setState(() {
                BlocProvider.of<AddNotesCubit>(context).color=colors[index];
                currentIndex=index;
              });

            },
            child: ColorItem(
              colorItem: colors[index],

              isChoosen:currentIndex==index ,
            ),
          ),
        );
      }),
    );
  }
}
