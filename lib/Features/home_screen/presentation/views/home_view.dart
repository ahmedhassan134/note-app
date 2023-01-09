import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Features/home_screen/presentation/widgets/home_view_body.dart';

import '../../../../cubites/display_notes/displaynotes_cubit.dart';
import '../widgets/add_note.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    BlocProvider.of<DisplaynotesCubit>(context).fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            context: context, builder: (context){

            return const AddNote();

          },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const HomeViewBody(),
    );
  }
}

