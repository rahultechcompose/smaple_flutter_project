// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistrationViewModel on _RegistrationViewModel, Store {
  Computed<bool> _$validateFieldsComputed;

  @override
  bool get validateFields =>
      (_$validateFieldsComputed ??= Computed<bool>(() => super.validateFields,
              name: '_RegistrationViewModel.validateFields'))
          .value;

  final _$isSubmitDisableAtom =
      Atom(name: '_RegistrationViewModel.isSubmitDisable');

  @override
  bool get isSubmitDisable {
    _$isSubmitDisableAtom.reportRead();
    return super.isSubmitDisable;
  }

  @override
  set isSubmitDisable(bool value) {
    _$isSubmitDisableAtom.reportWrite(value, super.isSubmitDisable, () {
      super.isSubmitDisable = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegistrationViewModel.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegistrationViewModel.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$statusAtom = Atom(name: '_RegistrationViewModel.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_RegistrationViewModelActionController =
      ActionController(name: '_RegistrationViewModel');

  @override
  void onLogin(String email, String password) {
    final _$actionInfo = _$_RegistrationViewModelActionController.startAction(
        name: '_RegistrationViewModel.onLogin');
    try {
      return super.onLogin(email, password);
    } finally {
      _$_RegistrationViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSubmitDisable: ${isSubmitDisable},
email: ${email},
password: ${password},
status: ${status},
validateFields: ${validateFields}
    ''';
  }
}
