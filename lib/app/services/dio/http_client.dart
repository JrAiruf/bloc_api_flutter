import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<Response>get(String url);
}
