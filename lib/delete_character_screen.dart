import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_cubit.dart';
import 'character_list_screen.dart';

class DeleteCharacterScreen extends StatefulWidget {
  @override
  _DeleteCharacterScreenState createState() => _DeleteCharacterScreenState();
}

class _DeleteCharacterScreenState extends State<DeleteCharacterScreen> {
  late Character selectedCharacter;

  @override
  void initState() {
    super.initState();
    selectedCharacter = characters.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eliminar Caracter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<Character>(
              value: selectedCharacter,
              onChanged: (Character? value) {
                if (value != null) {
                  setState(() {
                    selectedCharacter = value;
                  });
                }
              },
              items: characters
                  .map<DropdownMenuItem<Character>>((Character character) {
                return DropdownMenuItem<Character>(
                  value: character,
                  child: Text(character.name),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                characters.remove(selectedCharacter);
                context
                    .read<CharacterCubit>()
                    .deleteCharacter(selectedCharacter);
                Navigator.pop(context);
              },
              child: Text('Eliminar Caracter'),
            ),
          ],
        ),
      ),
    );
  }
}
