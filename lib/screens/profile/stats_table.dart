
import 'package:flutter/material.dart';
import 'package:flutter_rpg/common/styled_text.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: widget.character.points > 0
                  ? AppColors.highlightColor
                  : Colors.grey,
            ),
            const Expanded(child: SizedBox()),
            const StyledBodyText("Available points"),
            const Expanded(child: SizedBox(width: 50)),
            StyledBodyText(widget.character.points.toString()),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: AppColors.secondaryColor,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [StyledHeading("${widget.character.name}'s stats")],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Table(
            border: TableBorder(
              bottom: BorderSide(width: 1, color: AppColors.textColor),
              horizontalInside:
                  BorderSide(width: 1, color: AppColors.textColor),
            ),
            children: widget.character.formattedStatList.map((stat) {
              return TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: StyledTitle(stat["title"]!),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: StyledTitle(stat["value"]!),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: AppColors.successColor,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(stat["title"]!);
                        });
                      },
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.primaryAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.character.decreaseState(stat["title"]!);
                        });
                      },
                    )),
              ]);
            }).toList()),
      ],
    );
  }
}

// [
//             TableRow(children: [TableCell(child: StyledBodyText("TEST"))])
//           ],