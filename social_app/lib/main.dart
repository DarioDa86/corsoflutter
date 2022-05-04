import 'package:flutter/material.dart';
import 'package:social_app/routes.dart';

import 'routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App',
      initialRoute: '/home',
      routes: generateRoutes(),
    );
  }
}