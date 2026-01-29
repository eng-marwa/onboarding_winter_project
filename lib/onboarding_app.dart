import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';
import 'package:onboarding_winter_project/core/resources/app_text_styles.dart';
import 'package:onboarding_winter_project/presentation/auth/login_screen.dart';

class OnboardingApp extends StatelessWidget {
  const OnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
        fontFamily: AppTextStyles.fontFamily,
      ),
    );
  }
}
