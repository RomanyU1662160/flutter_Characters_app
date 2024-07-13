import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore with ChangeNotifier {
  final List<Character> _characters = [];

  get characters => _characters;

  void addNewCharacter(Character character) {
    _characters.add(character);
    FireStoreService.saveCharacterToFirestore(character);

    notifyListeners();
  }

  void removeCharacter(Character character) async {
    log("remove button clicked");
    _characters.remove(character);
    await FireStoreService.deleteCharacter(character.id);
    notifyListeners();
  }

  void updateCharacter(Character character) {
    FireStoreService.updateCharacterToFirestore(character);

    notifyListeners();
  }

  void fetchCharactersOnce() async {
    // if characters list is already fetched we don't need to fetch again
    if (characters.isEmpty) {
      final snapshot = await FireStoreService.getAllCharacters();
      log(snapshot.docs.toString());
      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }
}

// final List<Character> mockCharacters = [
//   Character(
//       id: "1", name: "Klara", slogan: "kapumf!", vocation: Vocation.wizard),
//   Character(
//       id: "2",
//       name: "Jonny",
//       slogan: "Light me up..!",
//       vocation: Vocation.junkie),
//   Character(
//       id: "3",
//       name: "Crimson",
//       slogan: "fire in the hotel..!",
//       vocation: Vocation.raider),
//   Character(
//       id: "4",
//       name: "Shaun",
//       slogan: "Alright then gang..",
//       vocation: Vocation.ninja),
// ];
