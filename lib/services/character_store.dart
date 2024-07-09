import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';

class CharacterStore with ChangeNotifier {
  final List<Character> _characters = [
    Character(
        id: "1", name: "Klara", slogan: "kapumf!", vocation: Vocation.wizard),
    Character(
        id: "2",
        name: "Jonny",
        slogan: "Light me up..!",
        vocation: Vocation.junkie),
    Character(
        id: "3",
        name: "Crimson",
        slogan: "fire in the hotel..!",
        vocation: Vocation.raider),
    Character(
        id: "4",
        name: "Shaun",
        slogan: "Alright then gang..",
        vocation: Vocation.ninja),
  ];

  get characters => _characters;

  void addNewCharacter(Character character) {
    _characters.add(character);
  }
}
