import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/characters/character_list.dart';
import 'package:flutter_rpg/common/styled_button.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/characters/create.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Character ..."),
        // Theme.of(context).colorScheme.onTertiary
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CharactersList(characters),
            // add Character button
            StyledButton(
                child: const StyledTitle("Create New "),
                //handleOnPress: () => {context.go("/create")}
                handleOnPress: () => {Navigator.pushNamed(context, "/create")})
          ],
        ),
      ),
    );
  }
}
