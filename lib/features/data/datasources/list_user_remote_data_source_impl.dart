import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:desafio_cuco/core/error/exceptions.dart';
import 'package:desafio_cuco/features/data/models/user_model.dart';

import 'list_user_remote_data_source.dart';

class ListUserRemoteDataSourceImpl implements ListUserRemoteDataSource {
  final http.Client client;
  ListUserRemoteDataSourceImpl({required this.client});

  Future<List<UserModel>> _getConcreteListUserToAPI(int count) async {
    final response = await client.get(
        Uri.parse('https://randomuser.me/api/?results=$count'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = jsonDecode(response.body);

      List<UserModel> _listUser = [];
      List<dynamic> results = responseMap['results'];

      for (var result in results) {
        _listUser.add(UserModel.fromJson(result));
      }
      return _listUser;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UserModel>> getConcreteListUser(int count) =>
      _getConcreteListUserToAPI(count);
}
