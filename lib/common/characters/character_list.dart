import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/characters/character_card.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/models/character.dart';

class CharactersList extends StatelessWidget {
  const CharactersList(this.characters, {super.key});

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: characters.isEmpty
          ? const StyledTitle("please add new character...")
          : ListView.builder(
              itemCount: characters.length,
              itemBuilder: (_, I) {
                return CharacterCard(characters[I]);
              }),
    );
  }
}
