
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_flutter_app/news_page.dart';
import 'package:sample_flutter_app/note/note_page.dart';
import 'package:sample_flutter_app/random_model.dart';
import 'package:sample_flutter_app/registration_page.dart';
import 'package:sample_flutter_app/todo/todo_page.dart';
import 'package:sample_flutter_app/ui/sample_ui.dart';
import 'package:sample_flutter_app/user_page.dart';
import 'package:sample_flutter_app/user_repository.dart';

import 'news_provider.dart';
import 'news_repository.dart';

GetIt getIt = GetIt.instance;

void main() {

  setUp();
  runApp(MyApp());
}
void setUp(){
  getIt.registerFactory(() => RandomModel());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<UserRepository>(UserRepository());
  getIt.registerSingleton(NewsProvider());
  getIt.registerSingleton(NewsRepository());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w800),
            headline3: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w600),
            subtitle1: TextStyle(
                fontSize: 10,
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w600),
          ),
          primarySwatch: Colors.blue,
        ),
        routes: {
          MyHomePage.route: (context) =>
              const MyHomePage(title: 'Flutter Demo Home Page'),
          UserPage.route: (context) => UserPage(),
          NewsPage.route: (context) => NewsPage(),
          RegistrationPage.route: (context) => RegistrationPage(),
          TodoPage.route: (context) => TodoPage(),
          NotePage.route: (context) => NotePage(),
          SampleUiPage.route: (context) => SampleUiPage()
        },
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  static const String route="/";

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UserPage.route);
              },
              child: const Text("User Profile"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NewsPage.route);
              },
              child: const Text("News"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RegistrationPage.route);
              },
              child: const Text("User Registration"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(TodoPage.route);
              },
              child: const Text("Todo"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NotePage.route);
              },
              child: const Text("Note"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SampleUiPage.route);
              },
              child: const Text("Sample UI"),
            ),
          ],
        ),
      ),
    );
  }
}
