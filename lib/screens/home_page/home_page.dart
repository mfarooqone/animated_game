import 'package:animate_do/animate_do.dart';
import 'package:animated_game/screens/home_page/count_down_timer.dart';
import 'package:animated_game/screens/home_page/current_question.dart';
import 'package:animated_game/screens/home_page/next_question.dart';
import 'package:animated_game/screens/home_page/operator_view.dart';
import 'package:animated_game/utills/app_colors.dart';
import 'package:animated_game/utills/app_text_style.dart';
import 'package:animated_game/utills/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ///
  ///
  ///
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  void initState() {
    super.initState();

    ///
    ///
    ///

    homePageController.rightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    homePageController.rightScaleAnimation =
        Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
          parent: homePageController.rightController, curve: Curves.easeInOut),
    );
    homePageController.rightController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        homePageController.rightController.reverse();
      }
    });

    ///
    ///
    ///
    homePageController.wrongController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    homePageController.wrongScaleAnimation =
        Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
          parent: homePageController.wrongController, curve: Curves.easeInOut),
    );
    homePageController.wrongController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        homePageController.wrongController.reverse();
      }
    });

    ///
    ///
    ///
    homePageController.currentQuestionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    ///
    ///
    ///
    homePageController.nextQuestionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
            child: homePageController.isLoading.value
                ? const CircularProgressIndicator()
                : Stack(
                    children: [
                      Column(
                        children: [
                          ///
                          ///
                          ///
                          Container(
                            width: 100.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6.h),
                                bottomRight: Radius.circular(6.h),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "ROUND \n 1of5",
                                  style: AppTextStyle.headlineMedium,
                                ),

                                ///
                                ///
                                ///
                                FadeIn(
                                  duration: const Duration(milliseconds: 1200),
                                  child: const CountDownTimer(),
                                ),

                                ///
                                ///
                                ///

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ScaleTransition(
                                      scale: homePageController
                                          .rightScaleAnimation,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(4.0.h),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(0.4.h),
                                              child: Image.asset(
                                                AppImagePath.check,
                                                height: 3.h,
                                                width: 3.h,
                                              ),
                                            ),
                                            Text(
                                              "${homePageController.correctScore}/${homePageController.totalScore}",
                                              style: AppTextStyle.headlineSmall
                                                  .copyWith(
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            SizedBox(width: 2.w)
                                          ],
                                        ),
                                      ),
                                    ),

                                    ///
                                    ///
                                    SizedBox(
                                      height: 1.h,
                                    ),

                                    ///
                                    ///
                                    ScaleTransition(
                                      scale: homePageController
                                          .wrongScaleAnimation,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(4.0.h),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(0.4.h),
                                              child: Image.asset(
                                                AppImagePath.x,
                                                height: 3.h,
                                                width: 3.h,
                                              ),
                                            ),
                                            Text(
                                              "${homePageController.wrongScore}/${homePageController.totalScore}",
                                              style: AppTextStyle.headlineSmall
                                                  .copyWith(
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            SizedBox(width: 2.w)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          ///
                          ///
                          ///
                          SizedBox(height: 2.h),

                          ///
                          ///
                          ///
                          FadeInLeftBig(
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              "Fill the Box",
                              style: AppTextStyle.headlineMedium,
                            ),
                          ),

                          ///
                          ///
                          ///
                          FadeInLeftBig(
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              "(40 pts)",
                              style: AppTextStyle.headlineMedium.copyWith(
                                color: AppColors.yellow,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          ///
                          ///
                          ///

                          SizedBox(height: 3.h),

                          homePageController.currentQuestionIndex == 0
                              ? FadeInLeftBig(
                                  duration: const Duration(milliseconds: 700),
                                  child: const CurrentQuestion(),
                                )
                              : FadeInUp(
                                  controller: (controller) {
                                    homePageController
                                        .currentQuestionController = controller;
                                  },
                                  duration: const Duration(milliseconds: 1000),
                                  child: const CurrentQuestion(),
                                ),

                          ///
                          ///
                          ///
                          const Spacer(),
                          if (homePageController.currentQuestionIndex <
                              homePageController.questions.length - 1)
                            FadeInLeftBig(
                              controller: (controller) => homePageController
                                  .nextQuestionController = controller,
                              duration: const Duration(milliseconds: 1000),
                              child: const NextQuestion(),
                            ),

                          ///
                          ///
                          ///

                          SizedBox(height: 3.h),

                          ///
                          ///
                          ///

                          FadeInLeftBig(
                              duration: const Duration(milliseconds: 900),
                              child: const OperatorView()),

                          ///
                          ///
                          ///

                          SizedBox(height: 6.h),
                        ],
                      ),

                      ///
                      ///
                      ///

                      AnimatedPositioned(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        left: homePageController.leftValue,
                        top: homePageController.topValue,
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                          child: const Center(
                            child: Text(
                              'Animate',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      ///
                      ///
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
