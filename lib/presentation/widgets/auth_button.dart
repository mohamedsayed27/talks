import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class CustomAuthButton extends StatelessWidget {
   const CustomAuthButton({Key? key,required this.onTap, required this.buttonLabel}) : super(key: key);
  final Function? onTap;
  final String buttonLabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20)
      ),
      height: 45,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          onTap!();
        },
        child: Text(
          buttonLabel,
          style: TextStyle(
              color: AppColors.blueColor),
        ),
      ),
    );
  }
}
