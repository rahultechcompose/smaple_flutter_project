import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_app/todo/todo_viewmodel.dart';
import 'package:sample_flutter_app/todo_model.dart';

class TodoItem extends StatelessWidget {
  TodoModel todoModel;
  Function completeMethod;
  int index;

  TodoItem(this.index, this.todoModel, this.completeMethod);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todoModel.todo,
                style: Theme.of(context).textTheme.subhead,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible:
                        todoModel.status == TaskStatus.incomplete.toString(),
                    child: SizedBox(
                        width: 100,
                        height: 30,
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fillColor: Colors.lightGreen,
                          onPressed: () {
                            completeMethod(index);
                          },
                          child: const Text(
                            "Complete",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(todoModel.date,
                      style: Theme.of(context).textTheme.subtitle),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    todoModel.time,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
