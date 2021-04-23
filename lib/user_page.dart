
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_app/response_model.dart';
import 'package:sample_flutter_app/viewmodel.dart';

class UserPage extends StatelessWidget {
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
      body: Container(
          child: Selector<UserViewModel, UserResponse>(
              builder: (context, data, child) {
                if(data!=null)
                   return Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text("${data.results.first.name.first}")
                       ],
                     ),
                   );
                else
                 return Center(child: Text("User Not Available"));
              }, selector: (_,viewmodel)=>viewmodel.userResponse)

      ),
    );
  }
}
