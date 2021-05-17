import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

part 'registration_viewmodel.g.dart';

class RegistrationViewModel = _RegistrationViewModel
    with _$RegistrationViewModel;

abstract class _RegistrationViewModel with Store {
  @observable
  bool isSubmitDisable = true;

  @observable
  String status="";

  set submitDisable(bool value) {
    isSubmitDisable = value;
  }

  @action
  void onLogin(String email, String password) {
    if (email == "admin@gmail.com" && password == "123456") {
      status="Login Successfully";
      log("Login Successfully");
      Fluttertoast.showToast(msg: "Login Successfully",toastLength: Toast.LENGTH_SHORT,);
    } else {
      status="Email or Password is incorrect";
      log("Email or Password is incorrect");
      Fluttertoast.showToast(msg: "Email or Password is incorrect",toastLength: Toast.LENGTH_SHORT,);
    }
  }
}
