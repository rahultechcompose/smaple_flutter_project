import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_app/registration_viewmodel.dart';
import 'package:sample_flutter_app/rounded_button.dart';
import 'common_methods.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewmodel = RegistrationViewModel();
    return Provider(
      create: (context) => viewmodel,
      child: RegistrationContent(viewmodel),
    );
  }
}

class RegistrationContent extends StatefulWidget {
  RegistrationViewModel viewModel;

  RegistrationContent(this.viewModel);

  @override
  State<StatefulWidget> createState() {
    return _RegistrationContent();
  }
}

class _RegistrationContent extends State<RegistrationContent> {
  TextEditingController emailController, passwordController;
  bool isDiable = true;
  final GlobalKey<FormState> _formKey =  GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25, top: 42),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        controller: emailController,
                        validator: (val) =>
                        !val.isEmailValid() ? "Please Enter Valid Email" : null,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email",
                        ),
                        onChanged: (str) {
                          validateFields();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        controller: passwordController,
                        obscureText:true ,
                        validator: (val) =>
                        !val.isPasswordValid() ? "Please Enter Password" : null,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Password",
                        ),
                        onChanged: (str) {
                          validateFields();
                        },
                      ),
                      margin: const EdgeInsets.only(left: 25, right: 25, top: 42),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return RoundedButton(
                        "Submit",
                            () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          } else {
                            widget.viewModel.onLogin(emailController.text,passwordController.text);
                          }
                        },
                        disable: widget.viewModel.isSubmitDisable,
                      );
                    }),
                  ],
                ),
              ),
              Observer(builder: (_)=>Center(child:Text(widget.viewModel.status,),))
            ],
          ),
        ));
  }

  void validateFields() {
    if (emailController.text.isEmailValid() &&
        passwordController.text.isPasswordValid()) {
      log("email pass word valid");
      widget.viewModel.submitDisable = false;
    } else {
      log("email password are invalid ");

      widget.viewModel.submitDisable = true;
    }
  }
}
