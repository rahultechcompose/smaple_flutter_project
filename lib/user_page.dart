import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_app/viewmodel.dart';

class UserPage extends StatelessWidget {
  static const String route="user_page";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: UserContent(),
    );
  }
}

class UserContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserContent();
  }
}

class _UserContent extends State<UserContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer<UserViewModel>(
          builder: (context, viewmodel, child) {
            if (viewmodel.userResponse != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipOval(
                        child: Image.network(
                          viewmodel.userResponse.results.first.picture.medium,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${viewmodel.userResponse.results.first.name.first} ${viewmodel.userResponse.results.first.name.last}",
                      style:
                      const TextStyle(fontSize: 18, color: Colors.black),
                    )
                  ],
                ),
              );
            } else {
              return  Center(child: Text(viewmodel.errorResult));
            }
          },
        ),
      )
    );
  }
}
