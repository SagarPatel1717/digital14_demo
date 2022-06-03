import 'package:flutter/material.dart';

import '../constant/const_value.dart';

class ThemeColors {
  Color get primaryColor {
    return isLightMode ? Colors.black : Colors.white;
  }

  static Color get primaryColorDark {
    return isLightMode ? Color(0xFF113145) : Colors.white;
  }

  static Color get primaryColorLight {
    return isLightMode ? Color(0xFF113145): Color(0xFF14F4C0);
  }

  static Color get accentColor {
    return isLightMode ? Color(0xFFFF6600) : Color(0xFFFFC502);
  }

  static Color get backgroundColor {
    return isLightMode ? Color(0xFFF9F9F9) : Color(0xFF121212);
  }

  static Color get zoomInOutTextColor {
    return isLightMode
        ? Colors.black.withOpacity(0.4)
        : Colors.white.withOpacity(0.7);
  }

  static Color get scaffoldBackgroundColor {
    return isLightMode ? Colors.white : Color(0xFF121212);
  }

  static Color get selectedTextColor {
    return isLightMode ? Colors.black : Colors.white;
  }

  static Color get highlightedTextColor {
    return isLightMode
        ? Color.fromARGB(255, 255, 92, 92)
        : Color.fromARGB(255, 92, 255, 92);
  }
}
