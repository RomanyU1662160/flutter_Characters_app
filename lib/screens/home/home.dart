import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/characters/character_list.dart';
import 'package:flutter_rpg/common/styled_button.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/characters/create.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
// use the provider to watch and get the characters list
    List<Character> characters = context.watch<CharacterStore>().characters;

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
            // Consumer<CharacterStore>(builder: (context, value, child) {
            //   return CharactersList(value.characters);
            // }),

            CharactersList(characters),
            // add Character button
            StyledButton(
                child: const StyledTitle("Create New "),
                //handleOnPress: () => {context.go("/create")}
                handleOnPress: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const CreateScreen()))
                    })
          ],
        ),
      ),
    );
  }
}
