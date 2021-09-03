import 'package:desafio_cuco/core/error/exceptions.dart';
import 'package:desafio_cuco/core/error/failures.dart';
import 'package:desafio_cuco/features/data/datasources/list_user_remote_data_source.dart';
import 'package:desafio_cuco/features/data/datasources/user_local_data_source.dart';
import 'package:desafio_cuco/features/data/datasources/user_remote_data_source.dart';
import 'package:desafio_cuco/features/domain/entities/user.dart';
import 'package:desafio_cuco/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final ListUserRemoteDataSource listUserRemoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.listUserRemoteDataSource,
    required this.userRemoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> getConcreteUser() async {
    try {
      final remoteUser = await userRemoteDataSource.getConcreteUser();
      localDataSource.cacheUser(remoteUser);
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getConcreteListUsers(int count) async {
    try {
      final listUser =
          await listUserRemoteDataSource.getConcreteListUser(count);
      return Right(listUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
