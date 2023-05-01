import 'package:flutter/material.dart';
import 'package:talks/core/constants/app_strings.dart';

import '../../../core/constants/reg_exp.dart';
import 'auth_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextFormField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      controller: controller,
      labelText: AppStrings.email,
      validation: (value){
        if(value!.isEmpty){
          return AppStrings.enterYourEmail;
        } else if(!RegularExp.emailRegex.hasMatch(value)){
          return AppStrings.invalidEmail;
        }else{
          return null;
        }
      },
    );
  }
}
