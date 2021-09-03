import 'package:dartz/dartz.dart';
import 'package:desafio_cuco/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>>? call(Params params) {
    return null;
  }
}

class NoParams {}
