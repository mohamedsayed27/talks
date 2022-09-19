import 'package:flutter/material.dart';
import 'package:talks/core/utils/app_colors.dart';

class AuthTextFormField extends StatelessWidget {
   const AuthTextFormField({Key? key, required this.controller, required this.labelText, required this.validation}) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final String validation;

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: AppColors.whiteColor),
    );
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white,fontSize: 18),
      cursorColor: AppColors.whiteColor,
      // cursorHeight: 20,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
        border:border,
        enabledBorder: border,
        focusedBorder: border,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white,fontSize: 20)
      ),
      validator: (value){
        if(value!.isEmpty){
          return validation;
        }else {
          return null;
        }
      },
    );
  }
}
