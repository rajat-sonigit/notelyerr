import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/Screens/settings/screens/setting.dart';
import 'package:notely/auth.dart';

class HomePage extends StatelessWidget {
  final String? name;
  final AuthController authController = Get.put(AuthController());

  HomePage({super.key, required this.name});

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
          children: [
            Text(
              'Welcome to the N🙂tely, ${name ?? 'User'}',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(SettingsPage(
                    name: name,
                  ));
                },
                child: Text("setting"))
          ],
        ),
      ),
    );
  }
}
