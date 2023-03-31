import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_cubit.dart';
import 'character_list_screen.dart';

class AddCharacterScreen extends StatefulWidget {
  @override
  _AddCharacterScreenState createState() => _AddCharacterScreenState();
}

class _AddCharacterScreenState extends State<AddCharacterScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadiendo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Ingrese el caracter que desea agregar',
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
                      characters.add(newCharacter);
                      context
                          .read<CharacterCubit>()
                          .setCharacter(newCharacter.name);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CharacterListScreen(),
                        ),
                      );
                    }
                  },
                  child: Text('OK'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
