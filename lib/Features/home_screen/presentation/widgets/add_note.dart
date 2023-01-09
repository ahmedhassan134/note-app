import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubites/add_notes/add_notes_cubit.dart';


import 'add_note_form.dart';


class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 16,left: 16,bottom: 20,top: 20),
      child: BlocConsumer<AddNotesCubit,AddNotesState>(
        listener: (context,state){
          if(state is AddNotesFailure){
            print('error occured is ${state.errorMsg}');
          }
          if(state is AddNotesSuccess){
            Navigator.pop(context);
            print('sssssshhhhhhhhhhhhhhhhhhhhhh');
          }
        },



          builder: (context,state){
          return ModalProgressHUD(
              inAsyncCall: state is AddNotesLoading ? true:false,
              blur: 10,
              child: const AddNoteForm());
          }),
    );
  }
}


