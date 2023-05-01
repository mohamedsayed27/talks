import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talks/core/app_colors/app_colors.dart';
import '../../core/assets_path/svg_path.dart';
import '../widgets/custom_nav_bar.dart';

class MainAppLayout extends StatefulWidget {
  const MainAppLayout({Key? key}) : super(key: key);

  @override
  State<MainAppLayout> createState() => _MainAppLayoutState();
}

class _MainAppLayoutState extends State<MainAppLayout> {
  int currentScreen = 1;
  List<Widget> screens =[
    Scaffold(
      backgroundColor: Colors.black,
    ),
    Scaffold(
      backgroundColor: Colors.black,

    ),
    Scaffold(
      backgroundColor: Colors.black,

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          screens[currentScreen],
          Padding(
            padding: EdgeInsets.only(left: 124.w, right: 124.w, bottom: 30.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(350.w, 75.h),
                  painter: CustomNavigationBar(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(50.r),
                      onTap: (){
                        setState(() {
                          currentScreen = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(7.r),
                        height: 50.h,
                        width: 60.w,
                        child: SvgPicture.asset(
                          SvgPath.addFriendIcon,
                          width: 44.w,
                          height: 30.h,
                          color: currentScreen == 0?AppColors.whiteColor:AppColors.bottomNavBarDisabledColor,
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30.r),
                      onTap: (){
                        setState(() {
                          currentScreen = 2;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(7.r),
                        height: 50.h,
                        width: 60.w,
                        child: SvgPicture.asset(
                          SvgPath.notificationIcon,
                          width: 30.w,
                          height: 34.7.h,
                          color: currentScreen == 2?AppColors.whiteColor:AppColors.bottomNavBarDisabledColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 100.h),
        child: Container(
          height: 60.h,
          width: 60.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blueColor.withOpacity(0.75)),
          child: IconButton(
            onPressed: (){
              setState(() {
                currentScreen = 1;
              });
              },
            icon: Center(
              child: SvgPicture.asset(
                SvgPath.chatsIcon,
                width: 44.w,
                height: 30.h,
                color: currentScreen == 1?AppColors.whiteColor:AppColors.bottomNavBarDisabledColor,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
