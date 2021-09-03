import 'package:desafio_cuco/features/data/models/user_model.dart';

abstract class ListUserRemoteDataSource {
  Future<List<UserModel>> getConcreteListUser(int count);
}
