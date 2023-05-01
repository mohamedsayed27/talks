import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talks/core/app_colors/app_colors.dart';
import 'package:talks/core/app_router/route_names.dart';

import '../../core/assets_path/images_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onLoading();
  }

  //loading when open app
  onLoading() {
    Timer(
      const Duration(seconds: 3),
        (){
        Navigator.pushReplacementNamed(context, ScreenName.authScreen);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
          color: AppColors.whiteColor,
        ),
        child: Center(child: Image.asset(ImagesPath.logo,width: 400.w,height: 350.h,)),
      ),
    );
  }
}