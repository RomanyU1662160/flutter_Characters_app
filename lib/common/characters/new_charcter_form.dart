import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/styled_button.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/common/vocation_card.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class NewCharacterForm extends StatefulWidget {
  const NewCharacterForm({super.key});

  @override
  State<NewCharacterForm> createState() => _NewCharacterFormState();
}

class _NewCharacterFormState extends State<NewCharacterForm> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  // handle form submission
  Vocation selectedVocation = Vocation.ninja;

  void handleSelectVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
    print(selectedVocation);
  }

  /// add new character
  void handleCreateNewCharacter() {
    var uuid = const Uuid();
    var newCharacter = Character(
        id: uuid.v4(),
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation);

    characters.add(newCharacter);
  }

  // override dispose to clear the controllers from the UI tree after submitting the form
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  bool handleValidation(String value, String field) {
    if (value.isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: StyledErrorTitle("Missing Character $field"),
              content: StyledBodyText("$field cannot be empty"),
              actions: [
                StyledButton(
                    child: const StyledBodyText("Dismiss"),
                    handleOnPress: () => Navigator.pop(context)),
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });
      return false;
    } else {
      return true;
    }
  }

  void handleSubmit() {
    bool isNameValid = handleValidation(_nameController.text.trim(), "name");
    if (!isNameValid) return;
    bool isSloganValid =
        handleValidation(_sloganController.text.trim(), "slogan");
    if (!isSloganValid) return;
    handleCreateNewCharacter();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const Home(),
        ));

    // context.go("/");
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

        VocationCard(
          vocation: Vocation.ninja,
          handleTap: handleSelectVocation,
          isSelected: selectedVocation == Vocation.ninja,
        ),
        VocationCard(
            vocation: Vocation.junkie,
            handleTap: handleSelectVocation,
            isSelected: selectedVocation == Vocation.junkie),
        VocationCard(
            vocation: Vocation.raider,
            handleTap: handleSelectVocation,
            isSelected: selectedVocation == Vocation.raider),
        VocationCard(
            vocation: Vocation.wizard,
            handleTap: handleSelectVocation,
            isSelected: selectedVocation == Vocation.wizard),
        Icon(
          Icons.code,
          color: AppColors.primaryAccent,
        ),
        const Center(child: StyledTitle("Good Luck")),
        const Center(
          child: StyledBodyText("And Enjoy the Journey..."),
        ),
        const SizedBox(
          height: 50,
        ),
        StyledButton(
            handleOnPress: handleSubmit,
            child: const StyledTitle("Submit"))
      ],
    );
  }
}
