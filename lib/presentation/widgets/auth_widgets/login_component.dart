import 'package:flutter/material.dart';
import 'package:talks/core/app_router/route_names.dart';
import 'package:talks/core/constants/app_strings.dart';
import 'package:talks/presentation/widgets/auth_widgets/paswword_text_form_field.dart';
import 'package:talks/presentation/widgets/custom_sized_box.dart';
import 'auth_button.dart';
import 'email_text_form_field.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({Key? key}) : super(key: key);

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomSizedBox(
            height: 15,
          ),
          EmailTextFormField(
            controller: emailController,
          ),
          const CustomSizedBox(
            height: 20,
          ),
          StatefulBuilder(
            builder: (context, sS) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PasswordTextFormField(
                    isObscure: !isObscure,
                    controller: passwordController,
                  ),
                  const CustomSizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all(Colors.white),
                        checkColor: Colors.blue,
                        value: isObscure,
                        onChanged: (value) {
                          sS(() {
                            isObscure = value!;
                          });
                        },
                      ),
                      const CustomSizedBox(
                        width: 5,
                      ),
                      const Text(
                        AppStrings.showPassword,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const CustomSizedBox(
            height: 30,
          ),
          CustomAuthButton(
            onTap: () async {
              Navigator.pushNamedAndRemoveUntil(context, ScreenName.mainLayout, (route) => false);
            },
            buttonLabel: AppStrings.login,
          )
        ],
      ),
    );
  }
}
