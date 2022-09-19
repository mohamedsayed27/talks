import 'package:get_it/get_it.dart';
import 'package:talks/data/datasource/remote_datasource.dart';
import 'package:talks/data/repository/repositor.dart';
import 'package:talks/domain/repository/base_repository.dart';
import 'package:talks/domain/usecases/login_usecase.dart';
import 'package:talks/domain/usecases/register_usecase.dart';

final sl = GetIt.instance;
class ServicesLocator{

  void init(){

    ///USE CASES
    sl.registerLazySingleton(() => PostLoginDataUseCase(sl()));
    sl.registerLazySingleton(() => PostRegistrationDataUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseRepository>(() => Repository(sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseRemoteDatasource>(() => RemoteDatasource());
  }
}