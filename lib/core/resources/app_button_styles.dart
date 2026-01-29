import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';

class AppButtonStyles {
  AppButtonStyles._();

  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 55),
    backgroundColor: AppColors.pinkF8Color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}
