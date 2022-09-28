import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talks/core/network/local/cash_helper.dart';
import 'package:talks/core/utils/app_colors.dart';
import 'package:talks/core/utils/screen_sizes.dart';
import 'package:talks/presentation/components/login_component.dart';
import 'package:talks/presentation/components/register_component.dart';
import 'package:talks/presentation/screens/home_screen.dart';
import '../../core/utils/some_widgets.dart';
import '../../domain/controllers/auth_cubit/auth_cubit.dart';
import '../../domain/controllers/auth_cubit/auth_state.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  bool isLoginOrRegister = true;

  Widget _listenerWidget() {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) async{
        final nav = Navigator.of(context);
        if(state is RegisterLoadingState || state is LoginLoadingState){
          showProgressIndicator(context);
        }
        if(state is RegisterSuccessState ){
          await CacheHelper.saveData(key: 'token', value: state.authModel.token);
          nav.pop();
          nav.push(MaterialPageRoute(builder: (context) => HomeScreen()));
          showToast("Registered Successfully");
        }
        if(state is LoginSuccessState){
          await CacheHelper.saveData(key: 'token', value: state.authModel.token);
          nav.pop();
          nav.push(MaterialPageRoute(builder: (context) => HomeScreen()));
          showToast('Login Successfully');
        }
        if(state is RegisterErrorState || state is LoginErrorState){
          nav.pop();
          showToast('Check your data');
        }

      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize = ScreenSize(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Column(
                children: [
                  SizedBox(
                    height: screenSize.wantedSize(size: 200),
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
                          borderRadius: const BorderRadiusDirectional.only(
                              topEnd: Radius.circular(35),
                              topStart: Radius.circular(35)),
                          color: AppColors.blueColor,
                        ),
                        child: StatefulBuilder(builder: (context, setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                 EdgeInsets.only(top: screenSize.wantedSize(size: 10), bottom: screenSize.wantedSize(size: 20)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isLoginOrRegister = true;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            'Sign up',
                                            style: TextStyle(
                                                fontSize: screenSize.wantedSize(size: 21),
                                                color: isLoginOrRegister
                                                    ? AppColors.whiteColor
                                                    : AppColors
                                                    .whiteDisabledColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          if (isLoginOrRegister)
                                            SizedBox(
                                              height: screenSize.wantedSize(size: 5),
                                            ),
                                          if (isLoginOrRegister)
                                            Container(
                                              width: screenSize.wantedSize(size: 40),
                                              height: screenSize.wantedSize(size: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20)),
                                            )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isLoginOrRegister = false;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            'Login',
                                            style: TextStyle(
                                                fontSize: screenSize.wantedSize(size: 21),
                                                color: isLoginOrRegister
                                                    ? AppColors
                                                    .whiteDisabledColor
                                                    : AppColors.whiteColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          if (!isLoginOrRegister)
                                            SizedBox(
                                              height: screenSize.wantedSize(size: 5),
                                            ),
                                          if (!isLoginOrRegister)
                                            Container(
                                              width: screenSize.wantedSize(size: 40),
                                              height: screenSize.wantedSize(size: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20)),
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
                                  EdgeInsets.symmetric(horizontal: screenSize.wantedSize(size: 10)),
                                  child: LayoutBuilder(
                                    builder: (context , constraint) {
                                      return SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(minHeight: constraint.maxHeight),
                                          child: isLoginOrRegister
                                              ? const RegisterComponent()
                                              : const LoginComponent(),
                                        ),
                                      );
                                    },

                                  ),
                                ),
                              ),
                              _listenerWidget(),
                            ],
                          );
                        }),
                    ),
                  )
                ],
              ),
        ),
      ),
    );
  }
}
