import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_cubit.dart';
import 'character_list_screen.dart';

class EditCharacterScreen extends StatefulWidget {
  final Character character;

  EditCharacterScreen({required this.character});

  @override
  _EditCharacterScreenState createState() => _EditCharacterScreenState();
}

class _EditCharacterScreenState extends State<EditCharacterScreen> {
  late Character character;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    character = widget.character;
    _controller.text = character.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editando'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 20),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Ingrese el nuevo caracter que desea agregar',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final newCharacter =
                        Character(_controller.text.trim().toLowerCase());
                    if (newCharacter.name.isNotEmpty &&
                        !characters.contains(newCharacter)) {
                      characters[characters.indexOf(widget.character)] =
                          newCharacter;
                      context
                          .read<CharacterCubit>()
                          .setCharacter(newCharacter.name);
                      Navigator.pop(context, newCharacter);
                    }
                  },
                  child: Text('OK'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
