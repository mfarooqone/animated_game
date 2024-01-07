import 'package:animated_game/screens/home_page/restart_quiz.dart';
import 'package:animated_game/utills/app_text_style.dart';
import 'package:animated_game/utills/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home_page_controller.dart';

class QuizComplete extends StatefulWidget {
  const QuizComplete({Key? key}) : super(key: key);
  @override
  State<QuizComplete> createState() => _QuizCompleteState();
}

class _QuizCompleteState extends State<QuizComplete> {
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
          : Scaffold(
              body: Container(
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
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Quiz Complete ',
                        style: AppTextStyle.headlineMedium,
                        children: <TextSpan>[
                          ///
                          ///
                          ///
                          TextSpan(
                            text:
                                '\n\nRight Answers = ${homePageController.correctScore}',
                            style: AppTextStyle.headlineMedium,
                          ),

                          ///
                          ///
                          ///
                          TextSpan(
                            text:
                                '\n\nWrong Answers = ${homePageController.wrongScore}',
                            style: AppTextStyle.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const RestartQuiz(),
                  ],
                ),
              ),
            );
    });
  }
}
