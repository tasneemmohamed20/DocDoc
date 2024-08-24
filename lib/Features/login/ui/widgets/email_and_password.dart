import 'package:docdoc/Features/login/ui/widgets/password_validation.dart';
import 'package:docdoc/core/helpers/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  bool hasNumber = false;
  late TextEditingController passwordController;
  @override
  initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordValidation();
  }

  void setUpPasswordValidation() {
    passwordController.addListener(() {
      final value = passwordController.text;
      setState(() {
        hasUppercase = AppRegex.hasUpperCase(value);
        hasLowercase = AppRegex.hasLowerCase(value);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(value);
        hasMinLength = AppRegex.hasMinLength(value);
        hasNumber = AppRegex.hasNumber(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: IconButton(
              icon: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.mainBlue,
              ),
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
            ),
          ),
          verticalSpace(24),
          PasswordValidation(
            hasUppercase: hasUppercase,
            hasLowercase: hasLowercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasMinLength: hasMinLength,
            hasNumber: hasNumber,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
