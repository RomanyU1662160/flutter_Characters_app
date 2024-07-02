import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final String character;

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
              StyledBodyText(character),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.open_in_new,
                    color: AppColors.primaryAccent,
                    semanticLabel:
                        "view character details", // accessibility mode text
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
