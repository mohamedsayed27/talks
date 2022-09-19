

abstract class BaseRepository{
  Future<String> postRegistrationData({required String email,required String password,required String firstName,required String lastName,required bool gender});
  Future<String> postLoginData({required String email,required String password});

}