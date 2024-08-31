import 'package:docdoc/core/theming/app_color.dart';
import 'package:docdoc/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation(
      {super.key,
      required this.hasUppercase,
      required this.hasLowercase,
      required this.hasSpecialCharacters,
      required this.hasMinLength,
      required this.hasNumber});

  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasSpecialCharacters;
  final bool hasMinLength;
  final bool hasNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least one uppercase letter', hasUppercase),
        verticalSpace(2),
        buildValidationRow('At least one lowercase letter', hasLowercase),
        verticalSpace(2),
        buildValidationRow(
            'At least one special character', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least 8 characters', hasMinLength),
        verticalSpace(2),
        buildValidationRow('At least one number', hasNumber),
      ],
    );
  }
}

Widget buildValidationRow(String text, bool hasValidated) {
  return Row(
    children: [
      const CircleAvatar(
        radius: 2.5,
        backgroundColor: ColorsManager.grey,
      ),
      horizontalSpace(6),
      Text(
        text,
        style: TextStyles.font13BlueRegular.copyWith(
            color: hasValidated ? ColorsManager.grey : ColorsManager.darkBlue,
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2),
      )
    ],
  );
}
