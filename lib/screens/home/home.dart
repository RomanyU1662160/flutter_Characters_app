import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/characters/character_list.dart';
import 'package:flutter_rpg/common/styled_button.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/screens/characters/create.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/services/firestore_service.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  // fetch characters on the first render before the build
  void initState() {
    context.read<CharacterStore>().fetchCharactersOnce();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
// use the provider to watch and get the characters list
    FireStoreService.getAllCharacters();

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

            CharactersList(context.watch<CharacterStore>().characters),
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
