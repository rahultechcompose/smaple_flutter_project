
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_flutter_app/main.dart';
import 'package:sample_flutter_app/response_model.dart';
import 'package:sample_flutter_app/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  UserRepository userRepository;
  UserResponse _userResponse;
  String _errorResult="User Not Available";
  GetIt locator = GetIt();

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
   userRepository= getIt<UserRepository>();
    getData();
  }

  Future<void> getData() async {
    final result = await userRepository.getUser();
    result.when(onSuccess: (data) {
      userResponse=data;
    }, onError: (error) {
      errorResult=error;
    });
  }
}
