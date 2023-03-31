import 'package:bloc/bloc.dart';

import 'character_list_screen.dart';

class CharacterCubit extends Cubit<Character> {
  CharacterCubit() : super(characters.first);

  void setCharacter(String name) {
    final character = characters.firstWhere(
      (c) => c.name == name,
      orElse: () => characters.first,
    );
    emit(character);
  }

  void deleteCharacter(Character character) {
    characters.remove(character);
    if (characters.isNotEmpty) {
      setCharacter(characters.first.name);
    } else {
      setCharacter('');
    }
  }
}
