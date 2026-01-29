import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/resources/app_text_styles.dart';
import 'package:onboarding_winter_project/presentation/auth/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('''Welcome 
Back!''', style: AppTextStyles.blackColor24ExtraBold),
              SizedBox(height: 30),
              LoginForm(),

            ],
          ),
        ),
      ),
    );
  }
}
