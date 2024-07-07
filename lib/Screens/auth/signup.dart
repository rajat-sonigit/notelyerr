import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/Screens/auth/name.dart';
import 'package:notely/auth.dart';
import 'package:notely/elements/onboardingnavbar.dart';
import 'package:notely/elements/style.dart';
import 'package:notely/elements/textfield.dart';
import 'package:sizer/sizer.dart';

class Signup extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final PageController _controller = PageController(initialPage: 1);
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  Signup({Key? key}) : super(key: key);

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/lightsmile.png",
                        height: 130,
                        width: 250,
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Let's make",
                        style: TextStyle(color: tertiaryColor, fontSize: 35),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "an account;)",
                        style: TextStyle(color: tertiaryColor, fontSize: 35),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  color: tertiaryColor,
                  width: 100.w,
                  child: Padding(
                    padding: EdgeInsets.all(3.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: TextFormField(
                            controller: emailController,
                            focusNode: emailFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              emailFocusNode.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(passwordFocusNode);
                            },
                            style: const TextStyle(color: primaryColor),
                            decoration: const InputDecoration(
                              labelText: "Email",
                              hintText: "hint - xyz@email.com",
                              labelStyle: TextStyle(color: primaryColor),
                              hintStyle: TextStyle(color: primaryColor),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Center(
                          child: TextFormField(
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            obscureText: true,
                            style: const TextStyle(color: primaryColor),
                            decoration: const InputDecoration(
                              labelText: "Password",
                              hintText: "hint - password123",
                              labelStyle: TextStyle(color: primaryColor),
                              hintStyle: TextStyle(color: primaryColor),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Padding(
                          padding: EdgeInsets.only(left: 12.w, right: 12.w),
                          child: Row(
                            children: [
                              Flexible(
                                child: Center(
                                  child: Google_button(
                                    onTap: () {
                                      authController.googleSignIn();
                                    },
                                    radius: 10,
                                  ),
                                ),
                              ),
                              SizedBox(width: 3.h),
                              Flexible(
                                child: Center(
                                  child: Apple_button(
                                    onTap: () {},
                                    radius: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        OnboardingNavbar(
                          controller: _controller,
                          pageCount: 5, // Adjust this based on your pages count
                          showPrevious:
                              true, // First screen, no previous button
                          onNext: () {
                            String email = emailController.text.trim();
                            String password = passwordController.text.trim();
                            print(
                                "Signup: Email = $email, Password = $password");
                            Get.to(NamePage(email: email, password: password));
                          },
                          onPrevious: () {
                            Get.back(); // Implement navigation to previous page
                          },
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
