import 'package:dio/dio.dart';

String handleError(DioError error) {
  String errorDescription = "";
  if (error is DioError) {

    switch (error.type) {
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
        "Received invalid status code: ${error.response.statusCode}";
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

enum ApiCallStatus{init,loading,success,error}

extension ListCheck on List{
  bool isNullOrEmpty(){
     final list= toList();
    if(this==null||list.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
  bool isNotNullOrEmpty(){
    final list= toList();
    if(list!=null&&list.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

extension StringCheck on String {
  bool isNullorEmpty(){
    final str=toString();
    if(str==null||str.isEmpty)
      {
        return true;
      }
    else{
      return false;
    }
  }

  bool isEmailValid() {
    final str=toString();
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(str)) {
      return false;
    } else {
      return true;
    }
  }

  bool isPasswordValid() {
    final str=toString();
    if (!str.isNullorEmpty() && str.length >= 6) {
      return true;
    } else {
      return false;
    }
  }
}
