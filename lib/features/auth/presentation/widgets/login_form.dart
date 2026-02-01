import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/common_widgets/app_text_field.dart';
import 'package:onboarding_winter_project/core/di/module.dart';
import 'package:onboarding_winter_project/core/network/api_services.dart';
import 'package:onboarding_winter_project/core/resources/app_button_styles.dart';
import 'package:onboarding_winter_project/core/resources/app_images.dart';
import 'package:onboarding_winter_project/core/resources/app_text_styles.dart';
import 'package:onboarding_winter_project/core/utils/validation_util.dart';
import 'package:onboarding_winter_project/features/auth/data/data_sources/remote/remote_data_source.dart';
import 'package:onboarding_winter_project/features/auth/data/repository/auth_repository_impl.dart';
import 'package:onboarding_winter_project/features/auth/domain/use_cases/login_use_case.dart';
import 'package:onboarding_winter_project/features/auth/presentation/provider/auth_provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
            validator: (value) => ValidationUtil.validateUsername(value!),
            hint: 'username',
            icon: AppImages.user,
            controller: _usernameController,
          ),
          SizedBox(height: 30),
          AppTextField(
            validator: (value) => ValidationUtil.validatePassword(value!),
            controller: _passwordController,
            hint: 'password',
            icon: AppImages.lock,
            type: TextInputType.visiblePassword,
            isPassword: true,
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.pinkF8Color12Regular,
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            style: AppButtonStyles.primaryButtonStyle,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                getIt<AuthProvider>().login(
                  _usernameController.text,
                  _passwordController.text,
                );
              }
            },
            child: Text('Login', style: AppTextStyles.whiteColor20SemiBold),
          ),
        ],
      ),
    );
  }
}
