// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class CustomText extends StatelessWidget {
  String text;
  double? size;
  FontWeight? fontWeight;

  CustomText({
    super.key,
    required this.text,
    this.size = 25,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color:
            Theme.of(context).brightness == Brightness.dark
                ? Color.fromARGB(255, 255, 255, 255)
                : textColor,
      ),
    );
  }
}
