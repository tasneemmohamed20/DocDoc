import 'package:docdoc/core/helpers/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: 'Don\'t have an account?',
        style: TextStyles.font13DarkBlueRegular,
      ),
      TextSpan(
        text: ' Sign Up',
        style: TextStyles.font13BlueSemiBold,
         recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signUpScreen);
              },
      ),
    ]));
  }
}
