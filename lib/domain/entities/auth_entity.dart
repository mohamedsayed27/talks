import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String message;
  final String token;
  final String expireDate;

  const AuthEntity(
      {required this.message, required this.token, required this.expireDate});

  @override
  // TODO: implement props
  List<Object?> get props => [
        message,
        token,
        expireDate,
      ];
}
