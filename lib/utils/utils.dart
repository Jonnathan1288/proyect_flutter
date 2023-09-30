import 'package:flutter/material.dart';
import 'package:proyect_app/utils/icon_list.dart';

extension ColorExtension on String {
  toColor() {
    String hexColor = replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
      // hexColor = 'FF' + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
  }
}

extension IconsExtension on String {
  toIcon() {
    return IconList().iconMap[this];
  }
}
