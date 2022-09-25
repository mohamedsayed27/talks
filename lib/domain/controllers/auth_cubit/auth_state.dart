import 'package:talks/data/models/auth_model.dart';

abstract class AuthStates {}

class LoginInitial extends AuthStates {}


class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates{
  final AuthModel authModel;

  LoginSuccessState({required this.authModel});
}
class LoginErrorState extends AuthStates{
  final String error;
  LoginErrorState(this.error);
}

class RegisterLoadingState extends AuthStates{}
class RegisterSuccessState extends AuthStates{
  final AuthModel authModel;

  RegisterSuccessState({required this.authModel});
}
class RegisterErrorState extends AuthStates{
  final String error;
  RegisterErrorState(this.error);
}

class ChangePasswordVisibilityState extends AuthStates{}

class ChangeGenderState extends AuthStates{}