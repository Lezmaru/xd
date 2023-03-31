import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_cubit.dart';

class CharacterListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caracteres'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CharacterCubit, Character>(
              builder: (context, state) {
                return DropdownButton<Character>(
                  value: state,
                  items: characters
                      .map<DropdownMenuItem<Character>>(
                        (character) => DropdownMenuItem<Character>(
                          value: character,
                          child: Text(character.name),
                        ),
                      )
                      .toList(),
                  onChanged: (Character? character) {
                    context
                        .read<CharacterCubit>()
                        .setCharacter(character!.name);
                  },
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocProvider<CharacterCubit>(
                  create: (BuildContext context) =>
                      context.read<CharacterCubit>(),
                  child: Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/addCharacter');
                        },
                        child: Text('Agregar'),
                      );
                    },
                  ),
                ),
                BlocProvider<CharacterCubit>(
                  create: (BuildContext context) =>
                      context.read<CharacterCubit>(),
                  child: Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: () {
                          final selectedCharacter =
                              context.read<CharacterCubit>().state;
                          Navigator.pushNamed(context, '/editCharacter',
                              arguments: selectedCharacter);
                        },
                        child: Text('Editar'),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final selectedCharacter =
                        context.read<CharacterCubit>().state;
                    context
                        .read<CharacterCubit>()
                        .deleteCharacter(selectedCharacter);
                  },
                  child: Text('Eliminar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Character {
  final String name;

  Character(this.name);
}

final List<Character> characters = [
  Character('a'),
  Character('b'),
  Character('c'),
  Character('d'),
];
