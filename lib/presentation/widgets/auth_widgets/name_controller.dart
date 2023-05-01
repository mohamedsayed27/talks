import 'package:flutter/material.dart';
import 'package:talks/core/constants/app_strings.dart';

import 'auth_text_form_field.dart';

class NameController extends StatelessWidget {
  final TextEditingController controller;
  final bool isFirstName;
  const NameController({Key? key, required this.controller, required this.isFirstName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      controller: controller,
      labelText: isFirstName?AppStrings.firstName:AppStrings.secondName,
      validation: (value) {
        if (value!.isEmpty) {
          return isFirstName?AppStrings.enterYourFirstName:AppStrings.enterYourSecondName;
        } else {
          return null;
        }
      },
    );
  }
}
