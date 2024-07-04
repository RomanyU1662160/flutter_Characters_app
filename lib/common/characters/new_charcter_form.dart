import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/styled_button.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/common/vocation_card.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCharacterForm extends StatefulWidget {
  const NewCharacterForm({super.key});

  @override
  State<NewCharacterForm> createState() => _NewCharacterFormState();
}

class _NewCharacterFormState extends State<NewCharacterForm> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  // override dispose to clear the controllers from the UI tree after submitting the form
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // handle form submission

  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      print("Name cannot be empty...");
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      print("Slogan cannot be empty...");
      return;
    }
    print("name value is ${_nameController.text}");
    print("slogan value is: ${_sloganController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person_2),
            label: StyledBodyText("character name:"),
          ),
          style: GoogleFonts.kanit(
              textStyle: Theme.of(context).textTheme.bodyMedium),
          cursorColor: AppColors.highlightColor,
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: _sloganController,
          decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.emoji_people,
              ),
              label: StyledBodyText("Character slogan:")),
          style: GoogleFonts.kanit(
              textStyle: Theme.of(context).textTheme.bodyMedium),
          cursorColor: AppColors.highlightColor,
        ),
        const SizedBox(
          height: 30,
        ),

        // Select Vocation

        const Center(child: StyledTitle("Choose a Vocation...")),
        const Center(
          child: StyledBodyText("This determine your available skills"),
        ),
        const SizedBox(
          height: 30,
        ),
        // Column(
        //   children: [
        //     ListView.builder(
        //       itemBuilder: (_, I) {
        //         return VocationCard(vocation: Vocation.values[I]);
        //       },
        //       itemCount: Vocation.values.length,
        //     ),
        //   ],
        // ),
        const VocationCard(vocation: Vocation.ninja),
        const VocationCard(vocation: Vocation.junkie),
        const VocationCard(vocation: Vocation.raider),
        const VocationCard(vocation: Vocation.wizard),
        const SizedBox(
          height: 50,
        ),
        StyledButton(
            child: const StyledTitle("Submit"), handleOnPress: handleSubmit)
      ],
    );
  }
}
