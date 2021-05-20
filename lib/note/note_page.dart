import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_app/note/note_viewmodel.dart';
import 'package:sample_flutter_app/rounded_button.dart';

//ignore: must_be_immutable
class NotePage extends StatelessWidget {
  static const String route = "note_page";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = NoteViewModel();
    return Provider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text("Note"),
              TextField(
                decoration: const InputDecoration(hintText: "Enter Note"),
                controller: controller,
                onChanged: (str) {
                  viewModel.setNoteStr(str);
                },
              ),
              Observer(builder: (_) {
                return RoundedButton(
                  "ADD",
                  () {
                    viewModel.addNote();
                    controller.text = "";
                  },
                  disable: viewModel.addDisable,
                );
              }),
              Expanded(
                child: Observer(builder: (_) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(viewModel.noteList[index]),
                      );
                    },
                    itemCount: viewModel.noteList.length,
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
