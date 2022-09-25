import 'package:bloc/bloc.dart';
import 'package:talks/domain/controllers/user_cubti/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getUserData({required String id}) {
    emit(GetUserDataLoadingState());
    // Webservices.getUserData(id: id).then((value) {
    //   emit(GetUserDataSuccesState());
    // }).catchError((e) {
    //   emit(GetUserDataErrorState());
    // });
  }
}
