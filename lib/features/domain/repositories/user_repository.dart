import 'package:dartz/dartz.dart';
import 'package:desafio_cuco/core/error/failures.dart';
import 'package:desafio_cuco/features/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getConcreteUser();
  Future<Either<Failure, List<User>>> getConcreteListUsers(int count);
}
