import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elite2/home.dart';


Future main() async
{
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomepage (),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepage createState() => _MyHomepage();
}

class _MyHomepage extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {

    return home();
  }
}