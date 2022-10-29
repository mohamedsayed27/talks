
abstract class UserState {}

class UserInitial extends UserState {}
class GetUserDataLoadingState extends UserState {}
class GetUserDataSuccesState extends UserState {}
class GetUserDataErrorState extends UserState {
  final String error;

  GetUserDataErrorState(this.error);
}

