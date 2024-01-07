import 'package:animated_game/utills/app_colors.dart';
import 'package:animated_game/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home_page_controller.dart';

class NextQuestion extends StatefulWidget {
  const NextQuestion({Key? key}) : super(key: key);
  @override
  State<NextQuestion> createState() => _NextQuestionState();
}

class _NextQuestionState extends State<NextQuestion> {
  ///
  ///
  ///
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   homePageController.nextQuestionController.stop();
  //   homePageController.nextQuestionController.dispose();
  //   super.dispose();
  // }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return homePageController.isLoading.value
          ? const CircularProgressIndicator()
          : Column(
              children: [
                if (homePageController.currentQuestionIndex <
                    homePageController.questions.length - 1)
                  Container(
                    padding: EdgeInsets.all(1.h),
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.1),
                      border: Border.all(
                        color: AppColors.white,
                        width: 0.1.h,
                      ),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${homePageController.questions[homePageController.currentQuestionIndex + 1].operand1}',
                            style: AppTextStyle.bodyLarge,
                          ),

                          ///
                          Container(
                            width: 4.h,
                            height: 4.h,
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
                                style: AppTextStyle.bodyLarge,
                              ),
                            ),
                          ),

                          ///
                          ///
                          ///

                          ///
                          Text(
                            '${homePageController.questions[homePageController.currentQuestionIndex + 1].operand2}',
                            style: AppTextStyle.bodyLarge,
                          ),

                          ///
                          Text(
                            '=',
                            style: AppTextStyle.bodyLarge,
                          ),

                          ///
                          Text(
                            '${homePageController.questions[homePageController.currentQuestionIndex + 1].result}',
                            style: AppTextStyle.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            );
    });
  }
}
