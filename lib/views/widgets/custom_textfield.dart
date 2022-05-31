import 'package:flutter/material.dart';
import 'package:smartpay_ui/app/config/extensions.dart';
import 'package:smartpay_ui/app/styles.dart';

import '../../app/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    this.suffixIcon,
    this.textFormKey,
    this.controller,
    this.obscureText,
    this.enableInteractive,
    this.validator,
    this.prefixIcon,
    required this.enabled,
  }) : super(key: key);


  final String title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Key? textFormKey;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? enableInteractive;
  final String? Function(String?)? validator;
  final bool enabled;



  @override
  Widget build(BuildContext context) {
    TextStyle? style = textFieldInput16;
    return TextFormField(
      key: textFormKey,
      controller: controller,
      obscureText: obscureText!,
      validator: validator,
      enableInteractiveSelection: enableInteractive,
      decoration: InputDecoration(
          labelText: title,
          labelStyle: style,
          enabled: enabled,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide(
                  color: AppColors.primary
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(
              color: Colors.white
            )
          ),
          filled: true,
          fillColor: AppColors.textFieldColor,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon ?? null
      ),
    );
  }
}