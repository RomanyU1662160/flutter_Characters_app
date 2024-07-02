import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/characters/character_card.dart';

class CharactersList extends StatelessWidget {
  const CharactersList(this.characters, {super.key});

  final List characters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (_, I) {
            return CharacterCard(characters[I]);
          }),
    );
  }
}
