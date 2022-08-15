import 'package:flutter/material.dart';

class Config {
  /// 主题颜色
  static const int _primaryColorValue = 0xFFC8839C;
  static const Color primaryColor = Color(_primaryColorValue);
  static const Color primaryLightColor = Color(0xFFF5DAE3);
  static const Color primaryColorButton = Color(0xFFF5BAD0);
  static const MaterialColor primarySwatchColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFF6D1F3),
      100: Color(0xFFF5DAE3),
      200: Color(0xFFE47EBD),
      300: Color(0xFFDB59AB),
      400: Color(0xFFD23687),
      500: Color(_primaryColorValue),
      600: Color(0xFFA1126A),
      700: Color(0xff790d4c),
      800: Color(0xFF500938),
      900: Color(0xFF280419),
    },
  );

  static const double defaultPadding = 16.0;
  static const Color primaryColor26 =  Color(0x42C8839C);
}