// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsViewModel on _NewsViewModel, Store {
  final _$apiCallStatusAtom = Atom(name: '_NewsViewModel.apiCallStatus');

  @override
  ApiCallStatus get apiCallStatus {
    _$apiCallStatusAtom.reportRead();
    return super.apiCallStatus;
  }

  @override
  set apiCallStatus(ApiCallStatus value) {
    _$apiCallStatusAtom.reportWrite(value, super.apiCallStatus, () {
      super.apiCallStatus = value;
    });
  }

  final _$listAtom = Atom(name: '_NewsViewModel.list');

  @override
  Observable<List<NewsData>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Observable<List<NewsData>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_NewsViewModel.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$errorAtom = Atom(name: '_NewsViewModel.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_NewsViewModel.getData');

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
apiCallStatus: ${apiCallStatus},
list: ${list},
isLoading: ${isLoading},
error: ${error}
    ''';
  }
}
