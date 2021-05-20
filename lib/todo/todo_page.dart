import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_app/rounded_button.dart';
import 'package:sample_flutter_app/todo/todo_item.dart';

import 'todo_viewmodel.dart';

class TodoPage extends StatelessWidget {
  static const String route = "todo_page";
  TodoViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = TodoViewModel();
    return Provider(
      create: (context) => viewModel,
      child: TodoContent(viewModel),
    );
  }
}

class TodoContent extends StatefulWidget {
  TodoViewModel viewModel;

  TodoContent(this.viewModel);

  @override
  State<StatefulWidget> createState() {
    return _TodoContent();
  }
}

class _TodoContent extends State<TodoContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text("Active Todo"),
                Observer(builder: (_) {
                  if (widget.viewModel.list != null &&
                      widget.viewModel.list.isNotEmpty) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return TodoItem(index, widget.viewModel.list[index],
                            widget.viewModel.completeTodo);
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.viewModel.list.length,
                    );
                  } else {
                    return const SizedBox(
                      height: 300,
                      child: Center(
                        child: Text("No Todo available"),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text("Completed Todo"),
                Observer(builder: (context) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return TodoItem(
                          index, widget.viewModel.completedlist[index], null);
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.viewModel.completedlist.length,
                  );
                }),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDrawer();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddTaskDrawer() {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Add Task"),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: "Enter Task"),
                  maxLines: 3,
                  onChanged: (str) {
                    widget.viewModel.setTaskStr(str);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return RoundedButton(
                    "ADD",
                    () {
                      widget.viewModel.addTask();
                      Navigator.of(context).pop();
                    },
                    disable: widget.viewModel.addTaskDisable,
                  );
                })
              ],
            ),
          );
        }).whenComplete(() {
      widget.viewModel.taskStr = "";
    });
  }
}
