abstract class AuthStates {}

class LoginInitial extends AuthStates {}


class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates{}
class LoginErrorState extends AuthStates{}

class RegisterLoadingState extends AuthStates{}
class RegisterSuccessState extends AuthStates{}
class RegisterErrorState extends AuthStates{}

class ChangePasswordVisibilityState extends AuthStates{}

class ChangeGenderState extends AuthStates{}