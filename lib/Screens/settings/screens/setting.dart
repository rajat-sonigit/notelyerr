import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/Screens/Home/controller/homecontroller.dart';
import 'package:notely/Screens/settings/elements/slidermodechange.dart';
import 'package:notely/Screens/settings/elements/themecontrollr.dart';
import 'package:notely/Screens/settings/screens/changepfp.dart';
import 'package:notely/Screens/settings/screens/profile.dart';
import 'package:notely/Screens/auth/auth.dart';
import 'package:sizer/sizer.dart'; // Import your ThemeController

class SettingsPage extends StatelessWidget {
  final String? name;
  final AuthController authController = Get.put(AuthController());
  final ThemeController themeController = Get.put(ThemeController());
  final UserController userController = Get.put(UserController());

  SettingsPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Stack(
        children: [
          // Background color
          Container(
            color: theme.primaryColor,
          ),
          // Main content
          Column(
            children: [
              SizedBox(height: 12.h),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 3.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  Settings",
                      style: TextStyle(
                        color: theme.secondaryHeaderColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Container(
                      height: 9.h,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        color: theme.secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: theme.primaryColor),
                          decoration: InputDecoration(
                            hintText: "Change account name",
                            hintStyle: TextStyle(color: theme.primaryColor),
                            suffixIcon: Icon(
                              Icons.search,
                              color: theme.primaryColor,
                              size: 32,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      height: 10.h,
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        color: themeController
                            .currentRoundfiller, // Use themeController.currentRoundfiller for container background
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Obx(() {
                            return userController.profileImageUrl.value.isEmpty
                                ? CircleAvatar(
                                    radius: 6.w,
                                    child: Icon(Icons.person),
                                  )
                                : CircleAvatar(
                                    radius: 6.w,
                                    backgroundImage: NetworkImage(
                                        userController.profileImageUrl.value),
                                  );
                          }),
                          SizedBox(width: 4.w),
                          Text(
                            "Account name: $name",
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: theme.secondaryHeaderColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.to(ProfilePage(name: name));
                          },
                          child: Text("Change account name"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: theme.secondaryHeaderColor,
                            backgroundColor: themeController
                                .currentRoundfiller, // Use themeController.currentRoundfiller for button background
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(PfpPage(name: name));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: theme.secondaryHeaderColor,
                            backgroundColor: themeController
                                .currentRoundfiller, // Use themeController.currentRoundfiller for button background
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text("Change pfp"),
                        )
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            userController.uploadProfileImage();
                          },
                          child: Text("Change profile image"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: theme.secondaryHeaderColor,
                            backgroundColor: themeController
                                .currentRoundfiller, // Use themeController.currentRoundfiller for button background
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(PfpPage(name: name));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: theme.secondaryHeaderColor,
                            backgroundColor: themeController
                                .currentRoundfiller, // Use themeController.currentRoundfiller for button background
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text("Change pass"),
                        )
                      ],
                    ),
                    SizedBox(height: 2.h),
                    SlideButton(),
                    SizedBox(height: 2.h),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          authController.signOut();
                        },
                        child: Text(
                          "Sign out.",
                          style: TextStyle(
                            color: theme.secondaryHeaderColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
