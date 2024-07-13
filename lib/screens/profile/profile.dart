import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/styled_button.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/skills_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeading(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/vocations/${character.vocation.image}",
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledHeading(character.vocation.title),
                      StyledBodyText(character.vocation.description)
                    ],
                  )),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: double.infinity,
              color: AppColors.secondaryColor.withOpacity(0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: StyledTitle(character.slogan),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: StyledHeading(character.name),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const StyledTitle("Weapon:"),
                      const SizedBox(
                        width: 60,
                      ),
                      StyledBodyText(character.vocation.weapon)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const StyledTitle("Ability:"),
                      const SizedBox(
                        width: 60,
                      ),
                      StyledBodyText(character.vocation.ability)
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: StatsTable(character),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: SkillsList(character),
            ),
            // const SizedBox(
            //   height: 30,
            // ),
            Container(
              padding: const EdgeInsets.all(16),
              child: StyledButton(
                  child: const StyledBodyText("Save"),
                  handleOnPress: () {
                    context.read<CharacterStore>().updateCharacter(character);
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
            )
          ],
        ),
      ),
    );
  }
}
