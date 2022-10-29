import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talks/presentation/widgets/auth_button.dart';
import '../../domain/controllers/auth_cubit/auth_cubit.dart';
import '../../domain/controllers/auth_cubit/auth_state.dart';
import '../widgets/auth_text_form_field.dart';
class LoginComponent extends StatelessWidget {
   LoginComponent({Key? key}) : super(key: key);

   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
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
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 10,
              ),
              AuthTextFormField(
                controller: passwordController,
                labelText: 'Password',
                validation: (value){
                  if(value!.isEmpty){
                    return 'Enter Your Password';
                  }else{
                    return null;
                  }
                },
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
                     cubit.posLoginData(email: emailController.text, password: passwordController.text);
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
