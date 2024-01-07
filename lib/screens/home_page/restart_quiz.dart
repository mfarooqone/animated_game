import 'package:animated_game/utills/app_colors.dart';
import 'package:animated_game/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home_page_controller.dart';

class RestartQuiz extends StatefulWidget {
  const RestartQuiz({Key? key}) : super(key: key);
  @override
  State<RestartQuiz> createState() => _RestartQuizState();
}

class _RestartQuizState extends State<RestartQuiz> {
  ///
  ///
  ///
  final HomePageController homePageController = Get.put(HomePageController());

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return homePageController.isLoading.value
          ? const CircularProgressIndicator()
          : InkWell(
              onTap: () {
                homePageController.restartQuiz();
              },
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
                    "Restart Quiz",
                    style: AppTextStyle.headlineLarge,
                  ),
                ),
              ),
            );
    });
  }
}
