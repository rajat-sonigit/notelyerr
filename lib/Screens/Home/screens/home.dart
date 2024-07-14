import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/Screens/Home/controller/homecontroller.dart';
import 'package:notely/Screens/settings/screens/setting.dart';
import 'package:notely/Screens/auth/auth.dart';

class HomePage extends StatefulWidget {
  final String userId;

  HomePage({super.key, required this.userId});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController authController = Get.put(AuthController());

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to the Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authController.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Welcome to the N🙂tely, ${userController.userName.value}',
                  style: TextStyle(fontSize: 24),
                )),
            ElevatedButton(
              onPressed: () {
                Get.to(SettingsPage(name: userController.userName.value));
              },
              child: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
