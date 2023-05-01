import 'package:dio/dio.dart';
import 'package:talks/core/network/dio_helper.dart';
import '../../core/network/end_points.dart';


class Webservices{

  static Future<Response> postRegisterData({
  required String email,
    required String password,
    required String firstName,
  required String secondName,
    required bool gender
}) async{
    Response response = await DioHelper.postData(url: AppEndpoints.registerEndPoint, data:  {
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
    Response response = await DioHelper.postData(url: AppEndpoints.loginEndPoint, data:  {
      "email": email,
      "password": password,
    });
    return response;
  }

  static Future<Response> getUserData({
    required String id,
  })
  async{
    Response response = await DioHelper.getData(url:'${AppEndpoints.getUserDataEndPoint}$id');
    print(response);
    return response;
  }
}