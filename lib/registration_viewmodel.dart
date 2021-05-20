import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import 'comman_export.dart';

part 'registration_viewmodel.g.dart';

class RegistrationViewModel = _RegistrationViewModel
    with _$RegistrationViewModel;

abstract class _RegistrationViewModel with Store {
  @observable
  bool isSubmitDisable = true;

  @observable
  String email = "";

  @observable
  String password = "";

  set setEmail(String input) => email = input;

  set setPassword(String input) => password = input;

  @observable
  String status = "";

  set submitDisable(bool value) {
    isSubmitDisable = value;
  }

  @action
  void onLogin(String email, String password) {
    if (email == "admin@gmail.com" && password == "123456") {
      status = "Login Successfully";
      log("Login Successfully");
      Fluttertoast.showToast(
        msg: "Login Successfully",
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      status = "Email or Password is incorrect";
      log("Email or Password is incorrect");
      Fluttertoast.showToast(
        msg: "Email or Password is incorrect",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  void initMethod(int value) {
    email = "unknown $value";
    password = "unknown $value";
  }

  @computed
  bool get validateFields {
    if (email.isEmailValid() && password.isPasswordValid()) {
      return false;
    } else {
      return true;
    }
  }

  String validateEmail() =>
      email.isEmailValid() ? "Please Enter Valid Email" : null;

  String validatePassword() =>
      !password.isEmailValid() ? "Please Enter Password" : null;
}
