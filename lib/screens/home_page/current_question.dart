import 'package:animated_game/utills/app_colors.dart';
import 'package:animated_game/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home_page_controller.dart';

class CurrentQuestion extends StatefulWidget {
  const CurrentQuestion({Key? key}) : super(key: key);
  @override
  State<CurrentQuestion> createState() => _CurrentQuestionState();
}

class _CurrentQuestionState extends State<CurrentQuestion> {
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
          : SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    homePageController.currentQuestionIndex <
                            homePageController.questions.length
                        ? '${homePageController.questions[homePageController.currentQuestionIndex].operand1}'
                        : "",
                    style: AppTextStyle.headlineMedium,
                  ),

                  ///
                  Container(
                    width: 6.h,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.1),
                      border: Border.all(
                        color: AppColors.white,
                        width: 0.2.h,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "?",
                        style: AppTextStyle.headlineMedium,
                      ),
                    ),
                  ),

                  ///
                  ///
                  ///

                  ///
                  Text(
                    homePageController.currentQuestionIndex <
                            homePageController.questions.length
                        ? '${homePageController.questions[homePageController.currentQuestionIndex].operand2}'
                        : "",
                    style: AppTextStyle.headlineMedium,
                  ),

                  ///
                  Text(
                    '=',
                    style: AppTextStyle.headlineMedium,
                  ),

                  ///
                  Text(
                    homePageController.currentQuestionIndex <
                            homePageController.questions.length
                        ? '${homePageController.questions[homePageController.currentQuestionIndex].result}'
                        : "",
                    style: AppTextStyle.headlineMedium,
                  ),
                ],
              ),
            );
    });
  }
}
