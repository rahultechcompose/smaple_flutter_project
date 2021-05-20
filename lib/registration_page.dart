import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_app/registration_viewmodel.dart';
import 'package:sample_flutter_app/rounded_button.dart';

class RegistrationPage extends StatelessWidget {
  static const String route = "registration_page";

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int counter = 1;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("build");
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
                      margin:
                      const EdgeInsets.only(left: 25, right: 25, top: 42),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        controller: emailController,
                        // validator: (val) => widget.viewModel.validateEmail(),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email",
                        ),
                        onChanged: (str) {
                          widget.viewModel.setEmail = str;
                          // widget.viewModel.validateFields();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 25, right: 25, top: 42),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        controller: passwordController,
                        obscureText: true,
                        // validator: (val) => widget.viewModel.validatePassword(),
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Password",
                        ),
                        onChanged: (str) {
                          widget.viewModel.setPassword = str;
                          // widget.viewModel.validateFields();
                        },
                      ),
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
                            widget.viewModel.onLogin(
                                emailController.text, passwordController.text);
                          }
                        },
                        disable: widget.viewModel.validateFields,
                      );
                    }),
                    RoundedButton(
                      "set value",
                      () {
                        widget.viewModel.initMethod(counter++);
                      },
                    )
                  ],
                ),
              ),
              Observer(
                  builder: (_) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.viewModel.email,
                            ),
                            Text(
                              widget.viewModel.password,
                            ),
                            Text(
                              widget.viewModel.status,
                            ),
                          ],
                        ),
                      ))
            ],
          ),
        ));
  }
}
