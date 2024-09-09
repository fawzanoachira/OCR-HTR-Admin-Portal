import 'package:dio/dio.dart';

// const String baseURL = "http://192.168.16.54:8008/";
// const String baseURL = "http://192.168.16.75:8008/";
// const String baseURL = "http://192.168.8.129/";
const String baseURL = "https://ocr-annotator.icfoss.org/";
const String apiBaseURL = '${baseURL}v1/admin/';
final baseOptions = BaseOptions(baseUrl: apiBaseURL);
