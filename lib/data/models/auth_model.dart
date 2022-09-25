
class AuthModel{
  final String message;
  final String token;
  final String expireDate;

  AuthModel({
    required this.message,
    required this.token,
    required this.expireDate,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json){
    return AuthModel(
        message: json['message'],
        token: json['token']?? '',
        expireDate: json['tokenExpire']?? '',
    );
  }


}
