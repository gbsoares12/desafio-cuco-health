import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:desafio_cuco/core/error/exceptions.dart';
import 'package:desafio_cuco/features/data/models/user_model.dart';
import 'package:desafio_cuco/features/data/datasources/user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

  Future<UserModel> _getConcreteUserToAPI() async {
    final response = await client.get(Uri.parse('https://randomuser.me/api'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = jsonDecode(response.body);
      if (responseMap['erro'] == null) {
        return UserModel.fromJson(responseMap['results'][0]);
      } else {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getConcreteUser() => _getConcreteUserToAPI();
}
