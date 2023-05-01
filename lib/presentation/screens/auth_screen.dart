import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talks/core/assets_path/images_path.dart';
import 'package:talks/core/app_colors/app_colors.dart';
import 'package:talks/core/constants/app_strings.dart';

import '../widgets/auth_widgets/auth_tab_bar_button.dart';
import '../widgets/auth_widgets/login_component.dart';
import '../widgets/auth_widgets/register_component.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isChosen = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 314.h,
              child: Center(
                child: Image.asset(
                  ImagesPath.logo,
                ),
              ),
            ),
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(35.r),
                      topStart: Radius.circular(35.r)),
                  color: AppColors.blueColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AuthTabBarButton(
                            onPressed: () {
                              setState(() {
                                isChosen = true;
                              });
                            },
                            title: AppStrings.register,
                            isChosen: isChosen,
                            color: isChosen
                                ? AppColors.whiteColor
                                : AppColors.whiteDisabledColor,
                          ),
                          AuthTabBarButton(
                            onPressed: () {
                              print("object");
                              setState(() {
                                isChosen = false;
                              });
                            },
                            title: AppStrings.login,
                            isChosen: !isChosen,
                            color: !isChosen
                                ? AppColors.whiteColor
                                : AppColors.whiteDisabledColor,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: LayoutBuilder(
                          builder: (context, constraint) {
                            return SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: constraint.maxHeight),
                                child: isChosen
                                    ? const RegisterComponent()
                                    : const LoginComponent(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
