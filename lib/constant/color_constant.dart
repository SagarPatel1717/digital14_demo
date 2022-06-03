import 'package:flutter/material.dart';
import 'const_value.dart';

// ignore: avoid_classes_with_only_static_members
class AppColors {
  /// Static Colors
  static const Color searchBarInnerColor = Color(0xFF294658);
  static const Color black = Color(0xff000000);
  static const Color white = Colors.white;
  static Color blackLight = Color(0xff45474C).withOpacity(0.6);
  static const Color primaryColor = Color(0xFF113145);

  static Color favorite = Colors.redAccent;
  static Color backIcon = Colors.blueAccent;

  /// Dynamic colors as per the selected theme.
  static Color get background {
    return isLightMode ? Colors.red : Colors.blue;
  }

  static Color get theme {
    return isLightMode ? Colors.blue : Colors.blue;
  }
}
