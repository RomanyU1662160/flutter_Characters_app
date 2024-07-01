import 'package:flutter/material.dart';

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
        title: const Text(
          "You Characters...",
          style: TextStyle(color: Colors.white24),
        ),
        backgroundColor:
            Colors.brown[800], // Theme.of(context).colorScheme.onTertiary
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: const Text("Home page "),
      ),
    );
  }
}
