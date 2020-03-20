import 'package:flutter/material.dart';

class MyBottomNavBarItem {
  String text;
  IconData iconData;
  Color color;

  MyBottomNavBarItem({this.text, this.iconData, this.color});
}

class BarStyle {
    final double fontSize, iconSize;
    final FontWeight fontWeight;

    BarStyle({this.fontSize = 16, this.iconSize = 26, this.fontWeight = FontWeight.w600});
  }