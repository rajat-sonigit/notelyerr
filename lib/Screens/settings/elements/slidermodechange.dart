import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notely/Screens/settings/elements/themecontrollr.dart';
import 'package:notely/elements/style.dart';
import 'package:sizer/sizer.dart';

class SlideButton extends StatelessWidget {
  const SlideButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(() {
      return GestureDetector(
        onTap: themeController.toggleTheme,
        child: Container(
          width: 90.w,
          height: 10.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: themeController.darkmodefiller,
          ),
          child: Stack(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                        child: Text('Dark mode',
                            style: TextStyle(
                              color: secondaryHeaderColor,
                              fontSize: 17,
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                        child: Text('Light mode',
                            style: TextStyle(
                                color: secondaryHeaderColor, fontSize: 17))),
                  ),
                ],
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: themeController.isDarkMode.value
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 50.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: themeController.ThemeRoundfiller,
                  ),
                  child: const Center(
                    child: Text(
                      "Change Theme",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
