import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/characters/character_image.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/profile.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 10),
      // color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CharacterImg(
                  "assets/img/vocations/${character.vocation.image}", true),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledHeading(character.name),
                      StyledBodyText(character.slogan),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => Profile(character: character)))
                    },
                    child: Icon(
                      Icons.open_in_new,
                      color: AppColors.primaryAccent,
                      semanticLabel:
                          "view character details", // accessibility mode text
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
