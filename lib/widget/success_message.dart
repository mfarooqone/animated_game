import 'package:animated_game/utills/app_colors.dart';
import 'package:flutter/material.dart';

///
///
///
void showSuccessMessage(
  BuildContext context,
  String message, {
  ScaffoldMessengerState? messengerState,
}) {
  final s = messengerState ?? ScaffoldMessenger.of(context);
  s.showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: AppColors.positiveColor,
    ),
  );
}
