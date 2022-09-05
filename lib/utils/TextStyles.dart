import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle textStyleWithSizeColorWeight(fontSize, color, weight) {
  return TextStyle(
      height: 1.2,
      fontWeight: weight,
      fontSize: fontSize,
      color: color,
      fontFamily: 'Gilroy',
      decoration: TextDecoration.none);
}
