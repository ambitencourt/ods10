import 'package:dio/dio.dart';

final api = Dio(
  BaseOptions(
    baseUrl: 'https://ods10-backend-develop.herokuapp.com/api/',
    contentType: "application/json",
  ),
);
