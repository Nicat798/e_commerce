import 'dart:io';

import 'package:dio/dio.dart';

extension DioErrors on DioError {
  bool get isNoConnectionError {
    return type == DioErrorType.unknown && error is SocketException;
  }
}
