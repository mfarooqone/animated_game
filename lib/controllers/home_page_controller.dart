import 'package:animated_game/models/questions_model.dart';
import 'package:animated_game/screens/home_page/quiz_complete.dart';
import 'package:animated_game/screens/splash_screen/splash_screen.dart';
import 'package:animated_game/utills/app_colors.dart';
import 'package:animated_game/utills/app_text_style.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxBool isLoading = false.obs;
  // RxBool showAnimation = false.obs;
  // RxBool isRightAnswer = false.obs;
  final int countDownDuration = 10;

  final CountDownController countDownController = CountDownController();

  Color buttonColor = AppColors.black.withOpacity(0.1);
  Color buttonBorderColor = AppColors.white;
  TextStyle operatorTextStyle = AppTextStyle.headlineLarge;

  ///
  TextStyle answerTextStyle = AppTextStyle.headlineLarge.copyWith(
    color: Colors.transparent,
  );
  //

  ///
  @override
  void onInit() {
    super.onInit();
  }

  int correctScore = 0;
  int wrongScore = 0;
  int totalScore = 10;
  int currentQuestionIndex = 0;
  RxInt selectedButtonIndex = RxInt(-1);

  late AnimationController nextQuestionController;
  late AnimationController currentQuestionController;

  ///
  ///
  late AnimationController rightController;
  late AnimationController wrongController;
  late Animation<double> rightScaleAnimation;
  late Animation<double> wrongScaleAnimation;

  ///
  ///
  ///

  List<Question> questions = [
    Question(1, 1, 2),
    Question(3, 2, 6),
    Question(2, 1, 1),
    Question(2, 2, 1),
    Question(6, 2, 3),
    Question(4, 2, 8),
    Question(1, 2, 3),
    Question(17, 16, 1),
    Question(6, 2, 12),
    Question(7, 2, 5),
  ];

  List<String> operatorList = ['+', 'x', '-', '÷'];

  ///
  ///
  ///
  void handleButtonTap(int index) {
    selectedButtonIndex.value = index;
    buttonColor = AppColors.white;
    checkAnswer(selectedOperator: operatorList[index], buttonIndex: index);
  }

  ///
  ///
  ///
  String getCorrectOperator(Question question) {
    if (question.operand1 + question.operand2 == question.result) {
      return '+';
    } else if (question.operand1 - question.operand2 == question.result) {
      return '-';
    } else if (question.operand1 * question.operand2 == question.result) {
      return 'x';
    } else if (question.operand1 / question.operand2 == question.result) {
      return '÷';
    }
    return '';
  }

  ///
  ///
  ///
  void restartQuiz() {
    isLoading.value = true;
    correctScore = 0;
    wrongScore = 0;
    currentQuestionIndex = 0;
    buttonColor = AppColors.black.withOpacity(0.1);
    buttonBorderColor = AppColors.white;
    operatorTextStyle = AppTextStyle.headlineLarge;
    Get.offAll(() => const SplashScreen());
    isLoading.value = false;
  }

////
  ///
  ///

  ///
  ///
  ///
  void rightAnswer() {
    rightController.forward();
    correctScore++;
    operatorTextStyle =
        AppTextStyle.headlineLarge.copyWith(color: AppColors.black);
    Future.delayed(const Duration(milliseconds: 300), () {
      buttonColor = AppColors.green;
      answerTextStyle =
          AppTextStyle.headlineLarge.copyWith(color: AppColors.green);
      operatorTextStyle = AppTextStyle.headlineLarge;
      if (currentQuestionIndex < questions.length - 1) {
        nextQuestionController.repeat();
      }
      currentQuestionController.repeat();

      isLoading.value = true;
      isLoading.value = false;
      Future.delayed(const Duration(milliseconds: 300), () {
        buttonColor = AppColors.black.withOpacity(0.1);
        operatorTextStyle = AppTextStyle.headlineLarge;
        currentQuestionIndex++;

        ///
        ///
        ///

        print("currentQuestionIndex == $currentQuestionIndex");
        if (currentQuestionIndex >= questions.length) {
          Get.to(() => const QuizComplete());
          isLoading.value = false;
        }

        ///
        ///
        ///

        isLoading.value = true;
        isLoading.value = false;
      });
    });
  }

  void wrongAnswer() {
    wrongController.forward();
    wrongScore++;
    operatorTextStyle =
        AppTextStyle.headlineLarge.copyWith(color: AppColors.black);
    Future.delayed(const Duration(milliseconds: 300), () {
      buttonColor = AppColors.red;
      answerTextStyle =
          AppTextStyle.headlineLarge.copyWith(color: AppColors.red);
      operatorTextStyle = AppTextStyle.headlineLarge;
      if (currentQuestionIndex < questions.length - 1) {
        nextQuestionController.repeat();
      }

      currentQuestionController.repeat();

      isLoading.value = true;
      isLoading.value = false;
      Future.delayed(const Duration(milliseconds: 300), () {
        buttonColor = AppColors.black.withOpacity(0.1);
        operatorTextStyle = AppTextStyle.headlineLarge;
        currentQuestionIndex++;

        ///
        ///
        ///

        print("currentQuestionIndex == $currentQuestionIndex");
        if (currentQuestionIndex >= questions.length) {
          Get.to(() => const QuizComplete());
          isLoading.value = false;
        }

        ///
        ///
        ///
        isLoading.value = true;
        isLoading.value = false;
      });
    });
  }

  ///
  ///
  ///
  void checkAnswer({
    required String selectedOperator,
    required int buttonIndex,
  }) {
    isLoading.value = true;

    String correctOperator =
        getCorrectOperator(questions[currentQuestionIndex]);

    isLoading.value = false;
    if (selectedOperator == correctOperator) {
      ///
      buttonColor = AppColors.white;

      ///
      if (selectedButtonIndex.value == buttonIndex) {
        rightAnswer();
      }
    } else {
      wrongAnswer();
    }
  }
}
