part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUser extends UserEvent {}

class GetListUser extends UserEvent {
  final int count;

  GetListUser({required this.count});
}
