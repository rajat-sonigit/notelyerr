import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notely/Screens/auth/startscreen.dart';
import 'package:get/get.dart';
import 'package:notely/Screens/settings/elements/themecontrollr.dart';
import 'package:notely/Screens/settings/screens/setting.dart';
import 'package:notely/Screens/auth/auth.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      final ThemeController themeController = Get.put(ThemeController());

      return Obx(
        () {
          return GetMaterialApp(
            theme: themeController.lightTheme,
            darkTheme: themeController.darkTheme,
            themeMode: themeController.isDarkMode.value
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: StartScreen(),
          );
        },
      );
    });
  }
}
