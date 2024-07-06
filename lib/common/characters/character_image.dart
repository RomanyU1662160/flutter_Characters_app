import 'package:flutter/material.dart';

class CharacterImg extends StatelessWidget {
  const CharacterImg(this.src, this.isBlendMood, {super.key});
  final String src;
  final bool isBlendMood;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      src,
      width: 50,
      colorBlendMode: BlendMode.clear,
      fit: BoxFit.fitWidth,
      alignment: Alignment.center,
    );
  }
}
