import 'package:flutter/material.dart';

import 'package:myplants/themes/ColorThemes.dart';

class WeekDayButton extends StatefulWidget {
  final String day;
  bool initialValue;
  VoidCallback callback;

  WeekDayButton(
      {super.key,
      required this.day,
      required this.callback,
      required this.initialValue});

  @override
  State<WeekDayButton> createState() => _WeekDayButtonState(
      day: day, callback: callback, initialValue: initialValue);
}

class _WeekDayButtonState extends State<WeekDayButton> {
  final String day;
  bool initialValue;
  VoidCallback callback;

  bool selected = false;

  _WeekDayButtonState(
      {required this.day, required this.callback, required this.initialValue});

  @override
  void initState() {
    selected = initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
        callback();
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
