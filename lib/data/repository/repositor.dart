import 'package:talks/data/datasource/remote_datasource.dart';
import 'package:talks/domain/repository/base_repository.dart';

class Repository extends BaseRepository {
  final BaseRemoteDatasource baseRemoteDatasource;

  Repository(this.baseRemoteDatasource);

  @override
  Future<String> postLoginData({
    required String email,
    required String password,
  }) async {
    final result = await baseRemoteDatasource.postLoginData(
        email: email, password: password);
      return result;
  }

  @override
  Future<String> postRegistrationData({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required bool gender,
  }) async {
    final result = await baseRemoteDatasource.postRegistrationData(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        gender: gender);

      return result;

  }
}
