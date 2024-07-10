import 'package:dio/dio.dart';

const String baseURL = "http://192.168.16.54:8008/";
const String apiBaseURL = '${baseURL}v1/admin/';
final baseOptions = BaseOptions(baseUrl: apiBaseURL);
