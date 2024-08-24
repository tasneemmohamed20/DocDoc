import 'package:docdoc/core/theming/app_color.dart';
import 'package:docdoc/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.suffixIcon,
      this.isObscureText,
      this.fillColor,
      this.controller,
      required this.validator});
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: 18.h,
                horizontal: 20.w,
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(color: ColorsManager.mainBlue, width: 1.3),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                    color: ColorsManager.lighterGrey, width: 1.3),
              ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
          ),
          hintStyle: hintStyle ?? TextStyles.font14LightGreyRegular,
          hintText: hintText,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: fillColor ?? ColorsManager.moreLightGray),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14DarkBlueMedium,
      validator: (value) => validator(value!),
    );
  }
}
