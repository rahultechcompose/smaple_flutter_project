// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sampleui_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SampleUiViewModel on _SampleUiViewModel, Store {
  final _$iAtom = Atom(name: '_SampleUiViewModel.i');

  @override
  String get i {
    _$iAtom.reportRead();
    return super.i;
  }

  @override
  set i(String value) {
    _$iAtom.reportWrite(value, super.i, () {
      super.i = value;
    });
  }

  @override
  String toString() {
    return '''
i: ${i}
    ''';
  }
}
