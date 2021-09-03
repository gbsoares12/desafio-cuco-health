import 'package:desafio_cuco/features/data/models/user_model.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getLastUser();

  Future<void> cacheUser(UserModel userToCache);
}
