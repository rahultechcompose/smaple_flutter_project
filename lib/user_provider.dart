import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sample_flutter_app/main.dart';
import 'package:sample_flutter_app/response_model.dart';
import 'package:sample_flutter_app/result.dart';

class UserApiProvider{
  final String _endpoint = "https://randomuser.me/api"; 
  Dio _dio ;
  UserApiProvider(){
    _dio= getIt<Dio>();
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          return handler.next(options); //continue
        },
        onResponse:(response,handler) {
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          return  handler.next(e);//continue
        }
    ));
  }
  Future<Result<UserResponse,String>> getUser() async {
    try {
      Response response = await _dio.get(_endpoint);
      return Result.success(UserResponse.fromJson(response.data as Map<String,dynamic>));
    } catch (error, stacktrace) {
      return Result.error(_handleError(error as DioError));
    }
  }
}
String _handleError(DioError error) {
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
