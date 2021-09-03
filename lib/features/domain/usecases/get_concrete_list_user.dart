import 'package:dartz/dartz.dart';
import 'package:desafio_cuco/core/error/failures.dart';
import 'package:desafio_cuco/core/usercase/usercase.dart';
import 'package:desafio_cuco/features/domain/entities/user.dart';
import 'package:desafio_cuco/features/domain/repositories/user_repository.dart';

class GetConcreteListUser implements UseCase<List<User>, Params> {
  final UserRepository repository;

  GetConcreteListUser({required this.repository});

  @override
  Future<Either<Failure, List<User>>> call(Params params) async {
    return await repository.getConcreteListUsers(params.count);
  }
}

class Params {
  final int count;

  Params({
    required this.count,
  }) : super();
}
