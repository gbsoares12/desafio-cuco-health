import 'package:dartz/dartz.dart';
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:desafio_cuco/core/error/failures.dart';
import 'package:desafio_cuco/core/usercase/usercase.dart';
import 'package:desafio_cuco/features/domain/entities/user.dart';
import 'package:desafio_cuco/features/domain/usecases/get_concrete_list_user.dart';
import 'package:desafio_cuco/features/domain/usecases/get_concrete_user.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

const String SERVER_FAILURE_MESSAGE = "Erro ao conectar-se com o servidor.";
const String CACHE_FAILURE_MESSAGE = "Erro ao carregar o usuário.";

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetConcreteUser getConcreteUser;
  final GetConcreteListUser getConcreteListUser;

  UserBloc({
    required GetConcreteUser concreteUser,
    required GetConcreteListUser concreteListUser,
  })  : getConcreteUser = concreteUser,
        getConcreteListUser = concreteListUser,
        super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    switch (event.runtimeType) {
      case GetUser:
        yield Loading();
        final successfullConcreteUserOrFailure =
            await getConcreteUser(NoParams());

        yield* _eitherConcreteUserOrErrorState(
            successfullConcreteUserOrFailure);
        break;
      case GetListUser:
        yield Loading();
        final successfullConcreteListUserOrFailure = await getConcreteListUser(
            Params(count: (event as GetListUser).count));

        yield* _eitherConcreteListUserOrErrorState(
            successfullConcreteListUserOrFailure);
        break;
    }
  }

  Stream<UserState> _eitherConcreteUserOrErrorState(
      Either<Failure, User> failureOrUser) async* {
    yield failureOrUser.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (user) => LoadedUser(currentUser: user));
  }

  Stream<UserState> _eitherConcreteListUserOrErrorState(
      Either<Failure, List<User>> failureOrListUser) async* {
    yield failureOrListUser.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (listUser) => LoadedListUser(listUser: listUser));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
