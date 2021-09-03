import 'package:dartz/dartz.dart';
import 'package:desafio_cuco/core/error/failures.dart';
import 'package:desafio_cuco/core/usercase/usercase.dart';
import 'package:desafio_cuco/features/domain/entities/user.dart';
import 'package:desafio_cuco/features/domain/repositories/user_repository.dart';

class GetConcreteUser implements UseCase<User, NoParams> {
  final UserRepository repository;

  GetConcreteUser({required this.repository});

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getConcreteUser();
  }
}

// class Params {
//   final User currentUser;

//   Params({
//     @required this.currentUser,
//   }) : super();
// }
