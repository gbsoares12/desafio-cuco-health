import 'package:desafio_cuco/features/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getConcreteUser();
}
