import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talks/core/network/local/cash_helper.dart';
import 'package:talks/core/utils/app_colors.dart';
import 'package:talks/presentation/components/login_component.dart';
import 'package:talks/presentation/components/register_component.dart';
import 'package:talks/presentation/screens/home_screen.dart';
import '../widgets/some_widgets.dart';
import '../../domain/controllers/auth_cubit/auth_cubit.dart';
import '../../domain/controllers/auth_cubit/auth_state.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  bool isLoginOrRegister = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) async {
              final nav = Navigator.of(context);
              if (state is RegisterLoadingState || state is LoginLoadingState) {
                showProgressIndicator(context);
              }
              if (state is RegisterSuccessState) {
                await CacheHelper.saveData(
                    key: 'token', value: state.authModel.token);
                nav.pop();
                nav.push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
                showToast("Registered Successfully");
              }
              if (state is LoginSuccessState) {
                await CacheHelper.saveData(
                    key: 'token', value: state.authModel.token);
                nav.pop();
                nav.push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
                showToast('Login Successfully');
              }
              if (state is RegisterErrorState || state is LoginErrorState) {
                nav.pop();
                showToast('Check your data');
              }
            },
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return Column(
                children: [
                  SizedBox(
                    height: 314.h,
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo1.5x.png',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
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
                            padding:
                            EdgeInsets.only(top: 10.h, bottom: 20.h),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    cubit.changeBetweenSignup();
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Sign up',
                                        style: TextStyle(
                                            fontSize: 21.sp,
                                            color: cubit.isLoginOrRegister
                                                ? AppColors.whiteColor
                                                : AppColors
                                                .whiteDisabledColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      if (cubit.isLoginOrRegister)
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                      if (cubit.isLoginOrRegister)
                                        Container(
                                          width: 40.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20.r)),
                                        )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.changeToLogin();
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: 21.sp,
                                            color: cubit.isLoginOrRegister
                                                ? AppColors
                                                .whiteDisabledColor
                                                : AppColors.whiteColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      if (!cubit.isLoginOrRegister)
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                      if (!cubit.isLoginOrRegister)
                                        Container(
                                          width: 40.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20.r)),
                                        )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 10.w),
                              child: LayoutBuilder(
                                builder: (context, constraint) {
                                  return SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          minHeight: constraint.maxHeight),
                                      child: cubit.isLoginOrRegister
                                          ? RegisterComponent()
                                          : LoginComponent(),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
