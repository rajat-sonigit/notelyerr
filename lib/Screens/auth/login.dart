import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/Screens/auth/auth.dart';
import 'package:notely/elements/style.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.1.w),
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
                      height: 12.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Log in.",
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
                              hintText: "hint - warre@email.com",
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
                                    onTap: () async {
                                      // try {
                                      //   final credential = await SignInWithApple.getAppleIDCredential(
                                      //     scopes: [
                                      //       AppleIDAuthorizationScopes.email,
                                      //       AppleIDAuthorizationScopes.fullName,
                                      //     ],
                                      //     webAuthenticationOptions: WebAuthenticationOptions(
                                      //       clientId: 'your_client_id', // Replace with your own client ID
                                      //       redirectUri: Uri.parse('https://your-redirect-uri.com'), // Replace with your own redirect URI
                                      //     ),
                                      //   );
                                      //   // Once you have the credential, use it to sign in with Firebase
                                      //   await authController.signInWithApple(credential);
                                      // } catch (e) {
                                      //   print("Error signing in with Apple: $e");
                                      //   // Handle error
                                      // }
                                    },
                                    radius: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Center(
                          child: text_buttonPrimary(
                            onTap: () {
                              authController.login(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                            },
                            buttonColor: const Color.fromRGBO(226, 221, 203, 1),
                            buttonText: 'Log In',
                            buttonTextColor:
                                const Color.fromRGBO(214, 144, 105, 1),
                            pageIndexToNavigate:
                                1, // Replace with actual page index
                          ),
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
