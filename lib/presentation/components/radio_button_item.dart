import 'package:flutter/material.dart';
import 'package:talks/core/utils/app_colors.dart';


// ignore: must_be_immutable
class CustomRadioButtonItem extends StatelessWidget {
    CustomRadioButtonItem({Key? key, required this.genderTitle,required this.isMaleTrueOrFemaleFalse,required this.color}) : super(key: key);
   final String genderTitle;
    bool isMaleTrueOrFemaleFalse = true;
    Color? color;

   @override
  Widget build(BuildContext context) {
      return Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.whiteColor)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 6,right: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(genderTitle,style: const TextStyle(color: Colors.white,fontSize: 18),),
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.whiteColor),
                  color: color
                ),
              )
            ],
          ),
        ),
      );
  }
}

