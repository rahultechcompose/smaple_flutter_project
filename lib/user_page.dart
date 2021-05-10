import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_app/random_model.dart';
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
        // child: Selector<UserViewModel, UserResponse>(
        //     builder: (context, data, child) {
        //       if(data!=null) {
        //         return Center(
        //            child: Column(
        //              mainAxisAlignment: MainAxisAlignment.center,
        //              crossAxisAlignment: CrossAxisAlignment.center,
        //              children: [
        //                Container(
        //                  width: 100,height: 100,
        //                  child: ClipOval(
        //                    child: Image.network(data.results.first.picture.medium,fit: BoxFit.cover,),
        //                  ),
        //                ),
        //                SizedBox(height: 15,),
        //                Text("${data.results.first.name.first} ${data.results.first.name.last}",style: const TextStyle(fontSize: 18,color: Colors.black),)
        //              ],
        //            ),
        //          );
        //       } else {
        //         return const Center(child: Text("User Not Available"));
        //       }
        //     }, selector: (_,viewmodel)=>viewmodel.userResponse)
        child: Center(
          child: Consumer<UserViewModel>(
            builder: (context, viewmodel, child) {
              if (viewmodel.userResponse != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: ClipOval(
                          child: Image.network(
                            viewmodel.userResponse.results.first.picture.medium,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
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
        ),
      ),
    );
  }
}
