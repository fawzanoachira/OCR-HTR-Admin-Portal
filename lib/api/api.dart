import 'package:dio/dio.dart';

const String baseURL = "https://ocr-annotator.icfoss.org/";
const String apiBaseURL = '${baseURL}v1/admin/';
final baseOptions = BaseOptions(baseUrl: apiBaseURL);