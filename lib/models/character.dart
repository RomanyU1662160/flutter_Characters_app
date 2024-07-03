import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  Character({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
  });

// fields
  final String id;
  final String name;
  final String slogan;
  final Vocation vocation;
  final Set<Skill> skills = {};
  bool _isFav = false;

//getters
  bool get isFav => _isFav;

//methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkills(Skill skill) {
    skills.clear(); // clear skills to allow one skill only
    skills.add(skill);
  }
}

Character char = Character(
    id: "1", name: "character1", slogan: "Slogan1", vocation: Vocation.ninja);

// Dummy Data Characters

List<Character> characters = [
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
