import 'package:talks/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.message,
    required super.token,
    required super.expireDate,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json){
    return AuthModel(
        message: json['message'],
        token: json['token']?? '',
        expireDate: json['tokenExpire']?? '',
    );
  }
}
