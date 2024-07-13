import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';

// this class will responsible for working with DB to do CRUD functions.
class FireStoreService {
  static final ref = FirebaseFirestore.instance
      .collection("characters")
      .withConverter(
          fromFirestore: Character.fromFirestore,
          toFirestore: (Character C, _) => C.toFirestore());

// The WithConvertor will automatically use the defined function to convert Character class frm/to fireStore
  static Future<void> saveCharacterToFirestore(Character character) async {
    await ref.doc(character.id).set(character);
  }

  static Future<QuerySnapshot<Character>> getAllCharacters() async {
    return await ref.get();
  }

  static Future<void> updateCharacterToFirestore(Character character) async {
    await ref.doc(character.id).update({
      "stats": character.statsAsMap,
      "points": character.points,
      "skills": character.skills.map((S) => S.id),
      "isFav": character.isFav,
    });
  }

  static Future<void> deleteCharacter(String characterId) async {
    await ref.doc(characterId).delete();
  }
}
