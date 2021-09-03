part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class LoadedUser extends UserState {
  final User currentUser;

  LoadedUser({required this.currentUser});
}

class LoadedListUser extends UserState {
  final List<User> listUser;

  LoadedListUser({required this.listUser});
}

class Error extends UserState {
  final String message;

  Error({required this.message});
}

class Loading extends UserState {}
