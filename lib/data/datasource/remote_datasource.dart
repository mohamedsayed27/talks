import 'package:dio/dio.dart';
import 'package:talks/core/error/exception.dart';
import 'package:talks/core/network/error_message_model.dart';
import 'package:talks/core/network/remote/dio_helper.dart';
import 'package:talks/core/utils/app_constants.dart';
import 'package:talks/data/models/auth_model.dart';

abstract class BaseRemoteDatasource {
  Future<String> postRegistrationData(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required bool gender});

  Future<String> postLoginData(
      {required String email, required String password});
}

class RemoteDatasource extends BaseRemoteDatasource {
  AuthModel? loginModel;
  AuthModel? register;

  @override
  Future<String> postLoginData({
    required String email,
    required String password,
  }) async {
    Response response =
        await DioHelper.postData(url: AppConstants.loginEndPoint, data: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      loginModel = AuthModel.fromJson(response.data);
      return loginModel!.message;
    } else if (response.statusCode == 500) {
      return "some error occurred, please try later";
    } else {
      throw ServerModelException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<String> postRegistrationData({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required bool gender,
  }) async {
    Response response =
        await DioHelper.postData(url: AppConstants.registerEndPoint, data: {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
      "gender": gender,
    });
    if (response.statusCode == 200) {
      register = AuthModel.fromJson(response.data);
      print(response.data);
      return register!.message;
    } else if (response.statusCode == 500) {
      return "some error occurred, please try later";
    } else {
      throw ServerModelException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
