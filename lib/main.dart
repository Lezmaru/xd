import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_cubit.dart';
import 'add_character_screen.dart';
import 'character_list_screen.dart';
import 'edit_character_screen.dart';

void main() {
  runApp(
    BlocProvider<CharacterCubit>(
      create: (context) => CharacterCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Character List',
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => CharacterCubit(),
              child: CharacterListScreen(),
            ),
        '/addCharacter': (context) => BlocProvider.value(
              value: context.read<CharacterCubit>(),
              child: AddCharacterScreen(),
            ),
        '/editCharacter': (context) => BlocProvider.value(
              value: context.read<CharacterCubit>(),
              child: EditCharacterScreen(
                character:
                    ModalRoute.of(context)!.settings.arguments as Character,
              ),
            ),
      },
    );
  }
}
