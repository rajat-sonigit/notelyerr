import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/Screens/auth/signup.dart';
import 'package:notely/auth.dart';
import 'package:notely/elements/circles.dart';
import 'package:notely/elements/style.dart';
import 'package:sizer/sizer.dart';

class Dive extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
   Dive({super.key});

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
                  color: SecondaryColor,
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
                        Center(child: text_buttonPrimary(
                          onTap: () {
                            authController.register(Signup().emailController.text.trim(), Signup().passwordController.text.trim());
                          },
                          buttonColor: Color.fromRGBO(226, 221, 203, 1),
                          buttonText: 'Dive In',
                          buttonTextColor: Color.fromRGBO(10, 25, 48, 1),
                          pageIndexToNavigate: 1, // Replace with actual page index
                        )
                        ),


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
}
