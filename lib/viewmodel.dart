import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:sample_flutter_app/response_model.dart';
import 'package:sample_flutter_app/result.dart';
import 'package:sample_flutter_app/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  UserRepository userRepository;
  UserResponse _userResponse;
  String _errorResult="User Not Available";


  String get errorResult => _errorResult;

  set errorResult(String value) {
    _errorResult = value;
    notifyListeners();
  }

  UserResponse get userResponse => _userResponse;

  set userResponse(UserResponse value) {
    _userResponse = value;
    notifyListeners();
  }

  UserViewModel() {
    userRepository = UserRepository();
    getData();
  }

  getData() async {
    Result result = await userRepository.getUser();
    result.when(onSuccess: (data) {
      userResponse=data as UserResponse;
    }, onError: (error) {
      errorResult=error as String;
    });
  }
}
