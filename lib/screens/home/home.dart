import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/styled_button.dart';
import 'package:flutter_rpg/common/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List characters = [
    "Mario",
    "Luigi",
    "Peach",
    "Toad",
    "Bowser",
    "Koopa",
    "Mario2",
    "Luigi2",
    "Peach2",
    "Toad2",
    "Bowser2",
    "Koopa2"
  ];

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
            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (_, index) {
                  return Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 40),
                      color: Colors.grey[800],
                      child: Text(characters[index]));
                },
              ),
            ),

            // add Character button
            StyledButton(
                child: const StyledTitle("Create New "),
                handleOnPress: () {
                  print("button clicked...");
                })
          ],
        ),
      ),
    );
  }
}
