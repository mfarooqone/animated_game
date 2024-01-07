import 'package:animated_game/screens/home_page/home_page.dart';
import 'package:animated_game/utills/app_colors.dart';
import 'package:animated_game/utills/app_text_style.dart';
import 'package:animated_game/utills/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImagePath.backgroungImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => const HomePage());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.1),
                      border: Border.all(
                        color: AppColors.white,
                        width: 0.2.h,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Start Quiz",
                        style: AppTextStyle.headlineMedium,
                      ),
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
