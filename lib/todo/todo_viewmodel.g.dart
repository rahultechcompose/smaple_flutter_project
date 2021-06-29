// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoViewModel on _TodoViewModel, Store {
  Computed<bool> _$addTaskDisableComputed;

  @override
  bool get addTaskDisable =>
      (_$addTaskDisableComputed ??= Computed<bool>(() => super.addTaskDisable,
              name: '_TodoViewModel.addTaskDisable'))
          .value;

  final _$taskStrAtom = Atom(name: '_TodoViewModel.taskStr');

  @override
  String get taskStr {
    _$taskStrAtom.reportRead();
    return super.taskStr;
  }

  @override
  set taskStr(String value) {
    _$taskStrAtom.reportWrite(value, super.taskStr, () {
      super.taskStr = value;
    });
  }

  final _$listAtom = Atom(name: '_TodoViewModel.list');

  @override
  ObservableList<TodoModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<TodoModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$completedlistAtom = Atom(name: '_TodoViewModel.completedlist');

  @override
  ObservableList<TodoModel> get completedlist {
    _$completedlistAtom.reportRead();
    return super.completedlist;
  }

  @override
  set completedlist(ObservableList<TodoModel> value) {
    _$completedlistAtom.reportWrite(value, super.completedlist, () {
      super.completedlist = value;
    });
  }

  final _$_TodoViewModelActionController =
      ActionController(name: '_TodoViewModel');

  @override
  void setTaskStr(String input) {
    final _$actionInfo = _$_TodoViewModelActionController.startAction(
        name: '_TodoViewModel.setTaskStr');
    try {
      return super.setTaskStr(input);
    } finally {
      _$_TodoViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void completeTodo(int index) {
    final _$actionInfo = _$_TodoViewModelActionController.startAction(
        name: '_TodoViewModel.completeTodo');
    try {
      return super.completeTodo(index);
    } finally {
      _$_TodoViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskStr: ${taskStr},
list: ${list},
completedlist: ${completedlist},
addTaskDisable: ${addTaskDisable}
    ''';
  }
}
