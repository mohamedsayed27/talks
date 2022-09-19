import 'package:talks/domain/repository/base_repository.dart';


class PostLoginDataUseCase {
  final BaseRepository baseRepository;

  PostLoginDataUseCase(this.baseRepository);

  Future<String> postLoginData({
    required String email,
    required String password,
  }) async {
    return await baseRepository.postLoginData(email: email, password: password);
  }
}
