import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/Screens/auth/signup.dart';
import 'package:notely/Screens/Home/screens/home.dart';
import 'package:notely/Screens/auth/auth.dart';
import 'package:notely/elements/circles.dart';
import 'package:notely/elements/style.dart';
import 'package:sizer/sizer.dart';

class Dive extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final String email;
  final String password;
  final String name;
  Dive(
      {required this.email,
      required this.password,
      required this.name,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.1.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: primaryColor,
                height: 50.h,
                width: 100.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/smilea.png",
                        height: 130,
                        width: 250,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  color: secondaryHeaderColor,
                  width: 100.w,
                  child: Padding(
                    padding: EdgeInsets.all(3.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "We are",
                          style: TextStyle(color: primaryColor, fontSize: 35),
                        ),
                        const Text(
                          "done!",
                          style: TextStyle(color: primaryColor, fontSize: 35),
                        ),
                        const Text(
                          "Ready to dive into our app?",
                          style: TextStyle(color: primaryColor, fontSize: 18),
                        ),
                        const Text(
                          "Let's go!",
                          style: TextStyle(color: primaryColor, fontSize: 18),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Center(
                            child: text_buttonPrimary(
                          onTap: () {
                            print(
                                "Dive: Email = $email, Password = $password, Name = $name");
                            // AuthController.instance
                            //     .register(email, password, name);
                            _storeUserData(email,password,name );
                          },
                          buttonColor: Color.fromRGBO(226, 221, 203, 1),
                          buttonText: 'Dive In',
                          buttonTextColor: Color.fromRGBO(10, 25, 48, 1),
                          pageIndexToNavigate:
                              1, // Replace with actual page index
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _storeUserData(String email, String password, String name) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the UID
      String uid = userCredential.user!.uid;

      // Store user data in Firestore with the UID
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(uid);
      await userRef.set({
        'uid': uid,
        'email': email,
        'name': name,
      });

      print("User data stored successfully.");
      Get.to(HomePage(userId: uid,)); // Navigate to HomePage to display the name
    } catch (e) {
      print("Failed to store user data: $e");
    }
  }
}
