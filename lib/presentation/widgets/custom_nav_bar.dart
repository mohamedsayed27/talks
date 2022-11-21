import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';

class CustomNavigationBar extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.blueColor.withOpacity(0.75)..style = PaintingStyle.fill;
    Path path = Path()..moveTo(30.w, 65.h);
    path.arcToPoint( Offset(30.w,0),radius:  Radius.circular(10.r));
    path.quadraticBezierTo(30.w, 0, 50.w, 0);
    path.quadraticBezierTo(60.w, 0, 70.w, 10.h);
    path.arcToPoint( Offset(110.w, 10.h),radius:  Radius.circular(30.0.r),clockwise: false);
    path.quadraticBezierTo(120.w, 0, 130.w, 0);
    path.quadraticBezierTo(130.w, 0, 150.w, 0);
    path.arcToPoint( Offset(150.w, 65.h),radius:  Radius.circular(10.r));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
