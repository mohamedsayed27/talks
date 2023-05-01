import 'package:flutter/material.dart';
import 'package:talks/core/constants/app_strings.dart';
import 'package:talks/core/constants/reg_exp.dart';

import 'auth_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? confirmController;
  final bool isConfirmPassword;
  final bool isObscure;
  const PasswordTextFormField({Key? key, required this.controller, this.confirmController, this.isConfirmPassword = false, this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      controller: controller,
      isObscure: isObscure,
      labelText: isConfirmPassword?AppStrings.confirmPassword:AppStrings.password,
      validation: (value) {
        if(!isConfirmPassword){
          if (RegularExp.passwordRegex.hasMatch(value!)) {
            return AppStrings.invalidPassword;
          }
        }else{
          if(controller.text!=confirmController!.text){
            return AppStrings.invalidConfirmPassword;
          }

        }
        return null;
      },
    );
  }
}
