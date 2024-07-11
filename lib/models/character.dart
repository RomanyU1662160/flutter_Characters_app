import 'package:cloud_firestore/cloud_firestore.dart';
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

// map a character instance to a firestore document
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "slogan": slogan,
      "vocation": vocation.toString(),
      "skills": skills.map((S) => S.id).toList(),
      "isFav": _isFav,
      "stats": statsAsMap,
      "points": points,
    };
  }

// factory is method to initialize a Character instance without using the constructor method
// map a character from firestore and map it to create a Character instance
  factory Character.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;

    Character character = Character(
      id: snapshot.id,
      name: data["name"],
      slogan: data["slogan"],
      vocation:
          Vocation.values.firstWhere((V) => V.toString() == data["vocation"]),
    );

    Skill skill = mockSkills.firstWhere((S) => S.id == data["skills"][0]);
    character.updateSkills(skill);

// set isFav
    if (data["isFav"] == true) {
      character.toggleIsFav();
    }

    // set stats
    character.setState(points: data['points'], stats: data['stats']);
    return character;
  }
}
