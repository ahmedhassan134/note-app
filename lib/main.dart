import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubites/add_notes/add_notes_cubit.dart';

import 'Features/home_screen/presentation/views/home_view.dart';
import 'bloc_observer_helper.dart';
import 'constant/strings.dart';
import 'cubites/display_notes/displaynotes_cubit.dart';
import 'models/note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kBoxNotes);

  Bloc.observer=BlocObserverHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context)=>AddNotesCubit(),),
        BlocProvider(
          create: (context)=>DisplaynotesCubit(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: const HomeView(),
      ),
    );
  }
}
