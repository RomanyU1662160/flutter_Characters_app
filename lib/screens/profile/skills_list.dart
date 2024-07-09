import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/styled_button.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:toastification/toastification.dart';

class SkillsList extends StatefulWidget {
  const SkillsList(this.character, {super.key});

  final Character character;

  @override
  State<SkillsList> createState() => _SkillsListState();
}

class _SkillsListState extends State<SkillsList> {
  // late tells dart that this variable will have a vale later.
  late List<Skill> availableSkills;
  late Skill selectedSkill;

// We use initial state to access the widget object and give the value for availableSkills
// function "where" on a list is similar  to filter in JS
  @override
  void initState() {
    availableSkills = mockSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();
    // if the character has a skill already, we assign it to selectedSkill.
    if (widget.character.skills.isNotEmpty) {
      selectedSkill = widget.character.skills.first;
    }
    // if character has no skills we select the first skill in the available skills
    if (widget.character.skills.isEmpty) {
      selectedSkill = availableSkills[0];
    }
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const StyledTitle("selected Skill:"),
            const SizedBox(
              width: 20,
            ),
            StyledBodyText(selectedSkill.name),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: availableSkills.map((skill) {
            return Container(
              color: skill == selectedSkill
                  ? AppColors.successColor
                  : Colors.transparent,
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: GestureDetector(
                child: Image.asset(
                  "assets/img/skills/${skill.image}",
                  width: 80,
                ),
                onTap: () {
                  setState(() {
                    selectedSkill = skill;
                  });
                },
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 30,
        ),
        StyledButton(
            child: const StyledBodyText("Save"),
            handleOnPress: () {
              widget.character.updateSkills(selectedSkill);
              toastification.show(
                context: context,
                type: ToastificationType.success,
                style: ToastificationStyle.fillColored,
                title: const StyledBodyText("Saved..."),
                autoCloseDuration: const Duration(seconds: 7),
                icon: const Icon(Icons.check),
                primaryColor: AppColors.successColor,
                backgroundColor: AppColors.successColor,
                foregroundColor: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x07000000),
                    blurRadius: 16,
                    offset: Offset(0, 16),
                    spreadRadius: 0,
                  )
                ],
              );
            }),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
