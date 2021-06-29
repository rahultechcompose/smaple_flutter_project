// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoteViewModel on _NoteViewModel, Store {
  Computed<bool> _$addDisableComputed;

  @override
  bool get addDisable =>
      (_$addDisableComputed ??= Computed<bool>(() => super.addDisable,
              name: '_NoteViewModel.addDisable'))
          .value;

  final _$noteStrAtom = Atom(name: '_NoteViewModel.noteStr');

  @override
  String get noteStr {
    _$noteStrAtom.reportRead();
    return super.noteStr;
  }

  @override
  set noteStr(String value) {
    _$noteStrAtom.reportWrite(value, super.noteStr, () {
      super.noteStr = value;
    });
  }

  final _$noteListAtom = Atom(name: '_NoteViewModel.noteList');

  @override
  ObservableList<String> get noteList {
    _$noteListAtom.reportRead();
    return super.noteList;
  }

  @override
  set noteList(ObservableList<String> value) {
    _$noteListAtom.reportWrite(value, super.noteList, () {
      super.noteList = value;
    });
  }

  final _$_NoteViewModelActionController =
      ActionController(name: '_NoteViewModel');

  @override
  void setNoteStr(String input) {
    final _$actionInfo = _$_NoteViewModelActionController.startAction(
        name: '_NoteViewModel.setNoteStr');
    try {
      return super.setNoteStr(input);
    } finally {
      _$_NoteViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNote() {
    final _$actionInfo = _$_NoteViewModelActionController.startAction(
        name: '_NoteViewModel.addNote');
    try {
      return super.addNote();
    } finally {
      _$_NoteViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
noteStr: ${noteStr},
noteList: ${noteList},
addDisable: ${addDisable}
    ''';
  }
}
