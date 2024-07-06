import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/theme.dart';

class SkillsList extends StatefulWidget {
  const SkillsList(this.character, {super.key});

  final Character character;

  @override
  State<SkillsList> createState() => _SkillsListState();
}

class _SkillsListState extends State<SkillsList> {
  // late tells dart that this variable will have a vale later.
  late List<Skill> availableSkills;

// We use initial state to access the widget object and give the value for availableSkills
// function "where" on a list is similar  to filter in JS
  @override
  void initState() {
    availableSkills = mockSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.secondaryColor,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledHeading("Choose an active skill"),
              StyledBodyText("skills are unique to your vocation")
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: availableSkills.map((skill) {
            return Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/img/skills/${skill.image}",
                width: 80,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
