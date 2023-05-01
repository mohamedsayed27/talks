import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talks/core/constants/app_strings.dart';
import 'package:talks/presentation/widgets/auth_widgets/paswword_text_form_field.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../core/app_router/route_names.dart';
import '../custom_sized_box.dart';
import 'auth_button.dart';
import 'choose_gender_component.dart';
import 'email_text_form_field.dart';
import 'name_controller.dart';

class RegisterComponent extends StatefulWidget {
  const RegisterComponent({Key? key}) : super(key: key);

  @override
  State<RegisterComponent> createState() => _RegisterComponentState();
}

class _RegisterComponentState extends State<RegisterComponent> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firsNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isMaleOrFemale = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSizedBox(
            height: 27,
          ),
          NameController(
            controller: firsNameController,
            isFirstName: true,
          ),
          const CustomSizedBox(
            height: 20,
          ),
          NameController(
            controller: secondNameController,
            isFirstName: false,
          ),
          const CustomSizedBox(
            height: 20,
          ),
          EmailTextFormField(
            controller: emailController,
          ),
          const CustomSizedBox(
            height: 20,
          ),
          PasswordTextFormField(
            controller: passwordController,
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Text(
            AppStrings.passwordContent,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 14.sp,
            ),
          ),
          const CustomSizedBox(
            height: 15,
          ),
          PasswordTextFormField(
            controller: confirmPasswordController,
            isConfirmPassword: true,
            confirmController: passwordController,
          ),
          const CustomSizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.gender,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomSizedBox(
                height: 20,
              ),
              ChooseGenderComponent(
                isMaleTrueOrFemaleFalse: isMaleOrFemale,
              ),
            ],
          ),
          const CustomSizedBox(
            height: 32,
          ),
          CustomAuthButton(
            onTap: () async {
              Navigator.pushNamedAndRemoveUntil(context, ScreenName.mainLayout, (route) => false);
            },
            buttonLabel: AppStrings.register,
          ),
          const CustomSizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
