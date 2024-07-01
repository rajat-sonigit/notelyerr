import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/auth.dart';

class HomePage extends StatelessWidget {
  final String? name;
  final AuthController authController = Get.put(AuthController());

  HomePage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to the Home Page"),
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
        child: Text(
          'Welcome to the N🙂tely, ${name ?? 'User'}😘😘',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

