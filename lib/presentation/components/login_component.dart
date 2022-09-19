import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talks/presentation/components/auth_button.dart';
import '../../core/utils/some_widgets.dart';
import '../controllers/auth_cubit/auth_cubit.dart';
import '../controllers/auth_cubit/auth_state.dart';
import 'auth_text_form_field.dart';

class LoginComponent extends StatelessWidget {
  LoginComponent({Key? key}) : super(key: key);

  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
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
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
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
              Row(
                children: [
                  Checkbox(
                      fillColor: MaterialStateProperty.all(Colors.white),
                      checkColor: Colors.blue,
                      value: cubit.isPasswordVisible,
                      onChanged: (value) {
                        cubit.changePasswordVisibility(value);
                      }),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Show password",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomAuthButton(
                onTap: () async{
                  if(formKey.currentState!.validate()){
                    final result = await cubit.posLoginData(email: emailController.text, password: passwordController.text);
                    showSnackBar(content: result, context: context);
                  }
                },
                buttonLabel: 'Login',
              )
            ],
          ),
        );
      },
    );
  }
}
