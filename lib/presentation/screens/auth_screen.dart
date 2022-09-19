import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talks/core/utils/app_colors.dart';
import 'package:talks/presentation/components/login_component.dart';
import 'package:talks/presentation/components/register_component.dart';
import 'package:talks/presentation/controllers/auth_cubit/auth_cubit.dart';
import '../../core/services/services_locator.dart';
import '../../core/utils/some_widgets.dart';
import '../controllers/auth_cubit/auth_state.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  bool isLoginOrRegister = true;

  Widget _listenerWidget() {
    return BlocListener<AuthCubit, AuthStates>(
      listenWhen: (previous, current){
        return previous != current;
      },
      listener: (context, state) {
        if(state is RegisterLoadingState || state is LoginLoadingState){
          showProgressIndicator(context);
        }
        if(state is RegisterSuccessState || state is LoginSuccessState){
          Navigator.pop(context);
        }
        if(state is RegisterErrorState || state is LoginErrorState){
          Navigator.pop(context);
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthCubit(sl(),sl()),
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Column(
                children: [
                  SizedBox(
                    height: 200,
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
                        child: LayoutBuilder(
                            builder: (context, constraint) {
                              return SingleChildScrollView(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                                  child: StatefulBuilder(builder: (context, setState) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 10, bottom: 30),
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
                                                          fontSize: 21,
                                                          color: isLoginOrRegister
                                                              ? AppColors.whiteColor
                                                              : AppColors
                                                              .whiteDisabledColor,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    if (isLoginOrRegister == true)
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                    if (isLoginOrRegister == true)
                                                      Container(
                                                        width: 40,
                                                        height: 5,
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
                                                          fontSize: 21,
                                                          color: isLoginOrRegister
                                                              ? AppColors
                                                              .whiteDisabledColor
                                                              : AppColors.whiteColor,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    if (isLoginOrRegister == false)
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                    if (isLoginOrRegister == false)
                                                      Container(
                                                        width: 40,
                                                        height: 5,
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
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 10),
                                          child: isLoginOrRegister
                                              ? const RegisterComponent()
                                              : LoginComponent(),
                                        ),
                                        _listenerWidget(),
                                      ],
                                    );
                                  })
                                ),
                              );
                            },
                          ),
                    ),
                  )
                ],
              ),
        ),
      ),
    );
  }
}
