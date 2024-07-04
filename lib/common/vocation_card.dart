import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/models/vocation.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
  });

  final Vocation vocation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/img/vocations/${vocation.image}",
              width: 50,
              colorBlendMode: BlendMode.color,
              alignment: Alignment.center,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(vocation.name),
                    StyledBodyText(vocation.description),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
