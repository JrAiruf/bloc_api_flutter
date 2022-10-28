// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_api_flutter/app/models/user_model.dart';
import 'package:bloc_api_flutter/app/services/dio/dio_service_impl.dart';

class UserRepository {
  final dio = DioService();

  Future<List<UserModel>> getUsers() async {
    const url = 'https://reqres.in/api/users?page=2';
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data['data'] as List;
      return result.map((user) => UserModel.fromMap(user)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
