import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Model.dart';
import 'package:todoapp/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.yellow),
      home: Home(),
    );
  }
}
