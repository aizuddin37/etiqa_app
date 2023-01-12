import 'package:flutter/material.dart';

//----------------------------Source of Colors-------------------------------------------------
class ColorHelper {
  static Color parseColor(String hexColor) {
    String hex = hexColor.replaceAll("#", "");
    if (hex.isEmpty) hex = "ffffff";
    if (hex.length == 3) {
      hex =
          '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
    }
    Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
    return col;
  }
}

final Color primaryColor = ColorHelper.parseColor("#FECF07");
final Color buttonColor = ColorHelper.parseColor("#F1591D");
final Color bottomColor = ColorHelper.parseColor("#EFEFEF");
final Color grayTextColor = ColorHelper.parseColor("#413C32");
final Color disableColor = Colors.grey.shade200;
final Color lightYellow = ColorHelper.parseColor("#FFE400");
final Color lightBack = Color(0xFF4B4A49);
