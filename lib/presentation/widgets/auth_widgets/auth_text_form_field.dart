import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talks/core/app_colors/app_colors.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validation, this.isObscure = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColors.whiteColor),
    );
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      style: TextStyle(color: Colors.white, fontSize: 18.sp),
      cursorColor: AppColors.whiteColor,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
          ),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          errorStyle: TextStyle(
            fontSize: 10.sp,
            color: Colors.red,
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white, fontSize: 20.sp)),
      validator: validation,
    );
  }
}
