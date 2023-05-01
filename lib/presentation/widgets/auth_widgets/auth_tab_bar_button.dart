import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_colors/app_colors.dart';

class AuthTabBarButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color color;
  final bool isChosen;
  const AuthTabBarButton({Key? key, required this.onPressed, required this.title, required this.isChosen, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 21.sp,
                color: color,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.h,
          ),
          if(isChosen)Container(
            width: 40.w,
            height: 5.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(20.r)),
          )
        ],
      ),
    );
  }
}
