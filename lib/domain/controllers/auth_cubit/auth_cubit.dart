import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talks/data/models/auth_model.dart';
import 'package:talks/data/web_sevices/web_services.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(LoginInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isPasswordVisible = true;
  bool isLoginOrRegister = true;
  bool isMaleTrueOrFemaleFalse = true;

  AuthModel? authModel;

  void changeBetweenSignup(){
      isLoginOrRegister = true;
      emit(ChangeSignupAndLoginState());
  }
  void changeToLogin(){
    isLoginOrRegister = false;
    emit(ChangeSignupAndLoginState());
  }
  void changePasswordVisibility(bool? value) {
    isPasswordVisible = value!;
    emit(ChangePasswordVisibilityState());
  }

  void changeGenderState({
    required bool isMale,
  }) {
    if (isMale && !isMaleTrueOrFemaleFalse) {
      isMaleTrueOrFemaleFalse = true;
      emit(ChangeGenderState());
    } else if (!isMale && isMaleTrueOrFemaleFalse) {
      isMaleTrueOrFemaleFalse = false;
      emit(ChangeGenderState());
    } else {
      null;
    }
  }

  void posLoginData({required String email, required String password}) {
    emit(LoginLoadingState());
    Webservices.postLoginData(email: email, password: password).then((value) {
      emit(LoginSuccessState(authModel : AuthModel.fromJson(value.data)));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  void posRegisterData({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required bool gender,
  }) async {
    emit(RegisterLoadingState());
    Webservices.postRegisterData(
            email: email,
            password: password,
            firstName: firstName,
            secondName: lastName,
            gender: gender)
        .then((value) async{
      emit(RegisterSuccessState(authModel : AuthModel.fromJson(value.data)));
    }).catchError((e) {
      print(e.toString());
      emit(RegisterErrorState(e.toString()));
    });
  }
}
