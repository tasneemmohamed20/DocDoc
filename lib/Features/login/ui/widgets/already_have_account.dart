import 'package:flutter/material.dart';

import '../../../../core/theming/app_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: 'Already have an account?',
        style: TextStyles.font13DarkBlueRegular,
      ),
      TextSpan(
        text: 'Sign Up',
        style: TextStyles.font13BlueSemiBold,
      ),
    ]));
  }
}
