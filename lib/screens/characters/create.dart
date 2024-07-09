import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/characters/new_charcter_form.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledHeading("Character Creation"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(Icons.code, color: AppColors.primaryAccent),
              ),
              const Center(child: StyledTitle("Welcome, new player...")),
              const Center(
                child:
                    StyledBodyText("Create a name & slogan for your character"),
              ),
              const SizedBox(
                height: 30,
              ),
              const NewCharacterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
