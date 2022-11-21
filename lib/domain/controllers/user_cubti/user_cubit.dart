import 'package:bloc/bloc.dart';
import 'package:talks/domain/controllers/user_cubti/user_state.dart';

import '../../../data/web_sevices/web_services.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getUserData({required String id}) {
    emit(GetUserDataLoadingState());
    Webservices.getUserData(id: id).then((value) {
      print(value);
      emit(GetUserDataSuccesState());
    }).catchError((e) {
      print(e.toString());
      emit(GetUserDataErrorState(e.toString()));
    });
  }
}
