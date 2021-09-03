import 'package:http/http.dart' as http;
import 'package:desafio_cuco/features/domain/usecases/get_concrete_user.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/data/datasources/list_user_remote_data_source.dart';
import 'features/data/datasources/list_user_remote_data_source_impl.dart';
import 'features/data/datasources/user_local_data_source.dart';
import 'features/data/datasources/user_local_data_source_impl.dart';
import 'features/data/datasources/user_remote_data_source.dart';
import 'features/data/datasources/user_remote_data_source_impl.dart';
import 'features/data/repositories/user_repository_impl.dart';
import 'features/domain/repositories/user_repository.dart';
import 'features/domain/usecases/get_concrete_list_user.dart';
import 'features/presentation/controllers/bloc/user_bloc.dart';

final sl = GetIt.instance;

Future<void> initUser() async {
  //! Features

  //BloC
  sl.registerFactory(() => UserBloc(
        concreteUser: sl(),
        concreteListUser: sl(),
      ));

  //Use cases
  sl.registerLazySingleton(() => GetConcreteUser(repository: sl()));

  sl.registerLazySingleton(() => GetConcreteListUser(repository: sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        localDataSource: sl(),
        userRemoteDataSource: sl(),
        listUserRemoteDataSource: sl(),
      ));

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<ListUserRemoteDataSource>(
      () => ListUserRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sharedPreferences: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
