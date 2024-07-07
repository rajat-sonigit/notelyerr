import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/elements/style.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  ThemeData get lightTheme => ThemeData(
      primaryColor: primaryColor, // primary color for light mode
      secondaryHeaderColor: secondaryHeaderColor,
      brightness: Brightness.light
      // secondary color for light mode
      );

  ThemeData get darkTheme => ThemeData(
      primaryColor:
          secondaryHeaderColor, // secondary color used as primary for dark mode
      secondaryHeaderColor: primaryColor,
      brightness: Brightness.dark
      // primary color used as secondary for dark mode
      );

  ThemeData get currentTheme => isDarkMode.value ? darkTheme : lightTheme;

  Color get currentRoundfiller =>
      isDarkMode.value ? roundfillerdark : roundfiller;
  Color get ThemeRoundfiller =>
      isDarkMode.value ? roundfillerdark : tertiaryColor;
       Color get darkmodefiller =>
      isDarkMode.value ? darkmodebtn : roundfiller;


  void toggleTheme() {
    print('Toggle theme called, new value: ${!isDarkMode.value}');
    isDarkMode.value = !isDarkMode.value;
  }
}
