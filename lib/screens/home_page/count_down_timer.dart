import 'package:animated_game/controllers/home_page_controller.dart';
import 'package:animated_game/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({Key? key}) : super(key: key);
  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  final HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return homePageController.isLoading.value
          ? const CircularProgressIndicator()
          : CircularPercentIndicator(
              radius: 6.0.h,
              lineWidth: 0.8.h,
              percent: homePageController.percent,
              center: Text(
                "${homePageController.countDownDuration}",
                style: AppTextStyle.headlineLarge,
              ),
              progressColor: Colors.white,
              fillColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            );
    });
  }
}
