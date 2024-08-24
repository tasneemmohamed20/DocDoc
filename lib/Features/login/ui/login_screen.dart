import 'package:docdoc/Features/login/data/models/login_request_body.dart';
import 'package:docdoc/Features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/Features/login/ui/widgets/already_have_account.dart';
import 'package:docdoc/Features/login/ui/widgets/email_and_password.dart';
import 'package:docdoc/Features/login/ui/widgets/login_bloc_listener.dart';
import 'package:docdoc/Features/login/ui/widgets/terms_conditions.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/app_color.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(40),
                    AppTextButton(
                        buttonText: 'Login',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          validateThenDoLogin(context);
                        }),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const AlreadyHaveAccount(),
                    const LoginBlocListener()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoignState();
    }
  }
}
