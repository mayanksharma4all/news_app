import 'package:dio/dio.dart';
import 'package:newsapp/utils/constants.dart';

class Server {
  _Server() {}
  static Future<Response<dynamic>> getHeadLines() {
    Future<Response<dynamic>> future = Dio().get(Constants.NEWS_HEADLINES);
    return future;
  }
}
