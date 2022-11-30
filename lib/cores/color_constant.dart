import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {

  static Color mainColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color secondColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color whiteA700 = fromHex('#ffffff');


  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }




}
