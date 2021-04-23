import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sample_flutter_app/response_model.dart';

class UserApiProvider{
  final String _endpoint = "https://randomuser.me/api/";
  // BaseOptions options =
  // BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
  Dio _dio ;
  UserApiProvider(){
    _dio= Dio();
  }
  Future<UserResponse> getUser() async {
    log("getUser");
    try {
      Response response = await _dio.get(_endpoint);
      log("response ${response.toString()}");
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError(_handleError(error));
    }
  }
}
String _handleError(Error error) {
  String errorDescription = "";
  if (error is DioError) {
    DioError dioError = error as DioError;
    
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        errorDescription =
        "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        errorDescription =
        "Received invalid status code: ${dioError.response.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
    }
  } else {
    errorDescription = "Unexpected error occured";
  }
  return errorDescription;
}
