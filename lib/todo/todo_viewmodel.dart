import 'package:mobx/mobx.dart';
import 'package:sample_flutter_app/comman_export.dart';
import 'package:sample_flutter_app/todo_model.dart';

part 'todo_viewmodel.g.dart';

enum TaskStatus { incomplete, completed }

class TodoViewModel = _TodoViewModel with _$TodoViewModel;

abstract class _TodoViewModel with Store {
  @observable
  String taskStr = "";

  @action
  void setTaskStr(String input) => taskStr = input;

  @observable
  ObservableList<TodoModel> list = ObservableList();

  @observable
  ObservableList<TodoModel> completedlist = ObservableList();

  @computed
  bool get addTaskDisable {
    if (taskStr.isNullorEmpty()) {
      return true;
    } else {
      return false;
    }
  }

  void addTask() {
    final date = formatDate(DateTime.now());
    final time = formatTime(DateTime.now());
    final task = TodoModel(
        todo: taskStr,
        date: date,
        time: time,
        status: TaskStatus.incomplete.toString());
    taskStr = "";
    list.add(task);
  }

  @action
  void completeTodo(int index) {
    final todo = list[index];
    list.removeAt(index);
    todo.status = TaskStatus.completed.toString();
    completedlist.add(todo);
  }
}
