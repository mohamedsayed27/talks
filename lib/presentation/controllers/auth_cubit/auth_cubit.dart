import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/register_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  final PostLoginDataUseCase postLoginDataUseCase;
  final PostRegistrationDataUseCase postRegistrationDataUseCase;

  AuthCubit(this.postLoginDataUseCase, this.postRegistrationDataUseCase) : super(LoginInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isPasswordVisible = true;

  bool isMaleTrueOrFemaleFalse = true;

  void changePasswordVisibility(bool? value){
    isPasswordVisible = value!;
    emit(ChangePasswordVisibilityState());
  }

  void changeGenderState({required bool isMale}){
    if(isMale && !isMaleTrueOrFemaleFalse){
      isMaleTrueOrFemaleFalse = true;
      emit(ChangeGenderState());
    }else if(!isMale && isMaleTrueOrFemaleFalse){
      isMaleTrueOrFemaleFalse = false;
      emit(ChangeGenderState());
    }else{
      null;
    }

  }
  Future<String> posLoginData(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    String result = await postLoginDataUseCase.postLoginData(
        email: email, password: password);

    if (result == 'success') {
      emit(LoginSuccessState());
      return result;
    } else {
      emit(LoginErrorState());
      return result;
    }
  }

  Future<String> posRegisterData({required String email,
    required String password,
    required String firstName,
    required String lastName,
    required bool gender,}) async {
    emit(RegisterLoadingState());
    String result = await postRegistrationDataUseCase.postRegisterData(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        gender: gender);
    if (result == 'success') {
      emit(RegisterSuccessState());
      return result;
    } else {
      emit(RegisterErrorState());
      return result;
    }
  }



}
