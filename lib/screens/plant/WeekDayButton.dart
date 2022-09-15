import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myplants/themes/ColorThemes.dart';

class WeekDayButton extends StatefulWidget {
  final String day;

  const WeekDayButton({super.key, required this.day});

  @override
  State<WeekDayButton> createState() => _WeekDayButtonState(day: day);
}

class _WeekDayButtonState extends State<WeekDayButton> {
  final String day;

  bool selected = false;

  _WeekDayButtonState({required this.day});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: selected ? ColorThemes.lightGreen : ColorThemes.darkGrey,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Text(
          day,
          style: const TextStyle(
              color: ColorThemes.light,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
