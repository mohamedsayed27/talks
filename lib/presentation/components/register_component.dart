import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talks/presentation/widgets/auth_button.dart';
import '../../core/utils/app_colors.dart';
import '../widgets/radio_button_item.dart';
import '../../domain/controllers/auth_cubit/auth_cubit.dart';
import '../../domain/controllers/auth_cubit/auth_state.dart';
import '../widgets/auth_text_form_field.dart';
class RegisterComponent extends StatelessWidget {
   RegisterComponent({Key? key}) : super(key: key);
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final TextEditingController firsNameController = TextEditingController();
   final TextEditingController secondNameController = TextEditingController();
   final TextEditingController confirmPasswordController = TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      buildWhen: (previous, current){
        return previous != current;
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                height: 27.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: AuthTextFormField(
                      controller: firsNameController,
                      labelText: 'Firs name',
                      validation:  (value){
                        if(value!.isEmpty){
                          return 'Enter Your first name';
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: AuthTextFormField(
                      controller: secondNameController,
                      labelText: 'second name',
                      validation: (value){
                        if(value!.isEmpty){
                          return 'Enter Your second name';
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
               SizedBox(
                height: 10.h,
              ),
              AuthTextFormField(
                controller: emailController,
                labelText: 'Email',
                validation: (value){
                  if(value!.isEmpty){
                    return 'Enter Your Email';
                  }else{
                    return null;
                  }
                },
              ),
               SizedBox(
                height: 16.h,
              ),
              AuthTextFormField(
                controller: passwordController,
                labelText: 'Password',
                validation: (value){
                  RegExp regex =
                  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else if(value.length<6){
                    return ("Password Must be more than 5 characters");
                  }else if(!regex.hasMatch(value)){
                    return 'Password must contain upper,lower,digit and Special character';
                  }else{
                    return null;
                  }
                },
              ),SizedBox(
                height: 8.h,
              ),
               Text('Password must contain upper,lower,digit and Special character',style: TextStyle(color: AppColors.whiteColor,fontSize: 14.sp),),
               SizedBox(
                height: 15.h,
              ),
              AuthTextFormField(
                controller: confirmPasswordController,
                labelText: 'Confirm password',
                validation: (value){
                  if(value!.isEmpty){
                    return 'Enter password';
                  }else if(passwordController.text != confirmPasswordController.text){
                    return  'Password not compatible';
                  }else{
                    return null;
                  }

                },
              ),
               SizedBox(
                height: 50.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gender',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.changeGenderState(isMale: false);
                          },
                          child: CustomRadioButtonItem(
                            genderTitle: 'Female',
                            isMaleTrueOrFemaleFalse:
                                cubit.isMaleTrueOrFemaleFalse,
                            color: cubit.isMaleTrueOrFemaleFalse
                                ? Colors.blue
                                : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.changeGenderState(isMale: true);
                          },
                          child: CustomRadioButtonItem(
                            genderTitle: 'Male',
                            isMaleTrueOrFemaleFalse:
                                cubit.isMaleTrueOrFemaleFalse,
                            color: cubit.isMaleTrueOrFemaleFalse
                                ? Colors.white
                                : Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
               SizedBox(
                height: 32.h,
              ),
              CustomAuthButton(
                onTap: () async{
                  if(formKey.currentState!.validate()){
                     cubit.posRegisterData(email: emailController.text, password: passwordController.text, firstName: firsNameController.text, lastName: secondNameController.text, gender: cubit.isMaleTrueOrFemaleFalse);
                  }
                },
                buttonLabel: 'Login',
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
