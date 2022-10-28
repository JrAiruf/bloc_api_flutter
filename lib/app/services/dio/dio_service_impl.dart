// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'http_client.dart';

class DioService implements HttpClient {
  final dio = Dio();

  @override
  Future<Response> get(String url) async {
    final result = await dio.get(url);
    return result;
  }
}
