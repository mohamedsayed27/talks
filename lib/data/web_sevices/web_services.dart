import 'package:dio/dio.dart';
import 'package:talks/core/network/remote/dio_helper.dart';
import 'package:talks/core/utils/app_constants.dart';


class Webservices{

  static Future<Response> postRegisterData({
  required String email,
    required String password,
    required String firstName,
  required String secondName,
    required bool gender
}) async{
    Response response = await DioHelper.postData(url: AppConstants.registerEndPoint, data:  {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": secondName,
      "gender": gender,
    });
    return response;
  }

  static Future<Response> postLoginData({
    required String email,
    required String password,
  }) async{
    Response response = await DioHelper.postData(url: AppConstants.loginEndPoint, data:  {
      "email": email,
      "password": password,
    });
    return response;
  }

  static Future<Response> getUserData({required String id}) async{
    Response response = await DioHelper.getData(url: '${AppConstants.getUserDataEndPoint}$id');
    return response;
  }
}