import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/styled_text.dart';

class NewCharacterForm extends StatelessWidget {
  const NewCharacterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      child: const Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_2),
              label: StyledBodyText("character name:"),
            ),
          )
        ],
      ),
    );
  }
}
