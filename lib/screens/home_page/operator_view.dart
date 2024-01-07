import 'package:animated_game/utills/app_colors.dart';
import 'package:animated_game/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home_page_controller.dart';

class OperatorView extends StatefulWidget {
  const OperatorView({Key? key}) : super(key: key);
  @override
  State<OperatorView> createState() => _OperatorViewState();
}

class _OperatorViewState extends State<OperatorView> {
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
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 3.5),
                ),
                padding: EdgeInsets.zero,
                itemCount: homePageController.operatorList.length,
                itemBuilder: (context, index) {
                  bool isSelected =
                      index == homePageController.selectedButtonIndex.value;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        homePageController.handleButtonTap(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? homePageController.buttonColor
                              : AppColors.black.withOpacity(0.1),
                          border: Border.all(
                            color: AppColors.white,
                            width: 0.2.h,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            homePageController.operatorList[index],
                            style: isSelected
                                ? homePageController.operatorTextStyle
                                : AppTextStyle.headlineLarge,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
