import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/Screens/settings/elements/slidermodechange.dart';
import 'package:notely/Screens/settings/elements/themecontrollr.dart';
import 'package:notely/Screens/settings/screens/changepfp.dart';
import 'package:notely/Screens/auth/auth.dart';
import 'package:sizer/sizer.dart'; // Import your ThemeController

class ProfilePage extends StatelessWidget {
  final String? name;
  final AuthController authController = Get.put(AuthController());
  final ThemeController themeController = Get.put(ThemeController());
  final TextEditingController nameController = TextEditingController();

  ProfilePage({super.key, required this.name});

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
                    SizedBox(height: 2.h),
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
                          CircleAvatar(
                            radius: 6.w,
                            backgroundImage:
                                AssetImage('assets/notelyprofile.png'),
                          ),
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
                            Get.back();
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
                            Text(
                              "Change name : ",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Container(
                                height: 14
                                    .h, // Adjust the height to match the design

                                child: Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor, // Underline color
                                          width:
                                              2.0, // Adjust the width of the underline
                                        ),
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.grey, // Hint text color
                                        fontSize: 11
                                            .sp, // Adjust the font size to match the design
                                      ),
                                      border: InputBorder.none, // No border
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 8.0), // Adjust padding
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
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
