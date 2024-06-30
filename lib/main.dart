import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notely/Screens/auth/startscreen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: StartScreen(),
        );
      },
    );
  }
}
