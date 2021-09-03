import 'dart:convert';

import 'package:desafio_cuco/core/error/exceptions.dart';
import 'package:desafio_cuco/features/data/datasources/user_local_data_source.dart';
import 'package:desafio_cuco/features/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_USER = 'CACHED_USER';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel> getLastUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUser(UserModel userToCache) {
    return sharedPreferences.setString(
        CACHED_USER, jsonEncode(userToCache.toJson()));
  }
}
