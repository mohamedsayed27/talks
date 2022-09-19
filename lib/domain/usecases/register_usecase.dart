import 'package:talks/domain/repository/base_repository.dart';


class PostRegistrationDataUseCase {
  final BaseRepository baseRepository;

  PostRegistrationDataUseCase(this.baseRepository);

  Future<String> postRegisterData({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required bool gender,
  }) async {
    return await baseRepository.postRegistrationData(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        gender: gender);
  }
}
