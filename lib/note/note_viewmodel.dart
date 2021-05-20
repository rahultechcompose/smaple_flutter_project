import 'package:mobx/mobx.dart';
import 'package:sample_flutter_app/comman_export.dart';

part 'note_viewmodel.g.dart';

class NoteViewModel = _NoteViewModel with _$NoteViewModel;

abstract class _NoteViewModel with Store {
  @observable
  String noteStr = "";

  @action
  void setNoteStr(String input) => noteStr = input;

  @observable
  ObservableList<String> noteList = ObservableList<String>();

  @computed
  bool get addDisable {
    if (noteStr.isNullorEmpty()) {
      return true;
    } else {
      return false;
    }
  }

  @action
  void addNote() {
    noteList.add(noteStr);

    noteStr = "";
  }
}
