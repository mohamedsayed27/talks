import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talks/core/utils/some_widgets.dart';
import 'package:talks/presentation/components/auth_button.dart';
import 'package:talks/presentation/components/radio_button_item.dart';
import 'package:talks/presentation/controllers/auth_cubit/auth_cubit.dart';
import 'package:talks/presentation/controllers/auth_cubit/auth_state.dart';
import 'auth_text_form_field.dart';

// ignore: must_be_immutable
class RegisterComponent extends StatelessWidget {
  const RegisterComponent({Key? key}) : super(key: key);
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
  static final TextEditingController firsNameController = TextEditingController();
  static final TextEditingController secondNameController = TextEditingController();
  static final TextEditingController confirmPasswordController = TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      buildWhen: (previous, current){
        return previous != current;
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AuthTextFormField(
                      controller: firsNameController,
                      labelText: 'Firs name',
                      validation: 'Enter Your first name',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AuthTextFormField(
                      controller: secondNameController,
                      labelText: 'second name',
                      validation: 'Enter Your second name',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AuthTextFormField(
                controller: emailController,
                labelText: 'Email',
                validation: 'Enter Your Email',
              ),
              const SizedBox(
                height: 10,
              ),
              AuthTextFormField(
                controller: passwordController,
                labelText: 'Password',
                validation: 'Enter Your Password',
              ),
              const SizedBox(
                height: 10,
              ),
              AuthTextFormField(
                controller: confirmPasswordController,
                labelText: 'Confirm password',
                validation: 'Password aren\'t compatible',
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 30,
              ),
              CustomAuthButton(
                onTap: () async{
                  if(formKey.currentState!.validate()){
                    final result = await cubit.posRegisterData(email: emailController.text, password: passwordController.text, firstName: firsNameController.text, lastName: secondNameController.text, gender: cubit.isMaleTrueOrFemaleFalse);
                    showSnackBar(content: result, context: context);
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
