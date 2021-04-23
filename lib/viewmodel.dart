
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:sample_flutter_app/response_model.dart';
import 'package:sample_flutter_app/user_repository.dart';

class UserViewModel extends ChangeNotifier{
 UserRepository userRepository;
 UserResponse _userResponse;

 UserResponse get userResponse => _userResponse;

  set userResponse(UserResponse value) {
    _userResponse = value;
    notifyListeners();
  }

 UserViewModel(){
    userRepository=UserRepository();
    getData();
  }
  getData() async {
   userResponse= await userRepository.getUser();

  }
}