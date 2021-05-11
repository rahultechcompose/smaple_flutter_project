
import 'package:dio/dio.dart';
import 'package:sample_flutter_app/main.dart';
import 'package:sample_flutter_app/response_model.dart';
import 'package:sample_flutter_app/result.dart';

import 'common_methods.dart';

class UserApiProvider{
  final String _endpoint = "https://randomuser.me/api"; 
  final _dio = getIt<Dio>() ;

/*  UserApiProvider(){
    *//*_dio= getIt<Dio>();
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
    ));*//*
  }*/
  Future<Result<UserResponse,String>> getUser() async {
    try {
      final response = await _dio.get(_endpoint);
      return Result.success(UserResponse.fromJson(response.data as Map<String,dynamic>));
    } catch (error, stacktrace) {
      return Result.error(handleError(error as DioError));
    }
  }
}
