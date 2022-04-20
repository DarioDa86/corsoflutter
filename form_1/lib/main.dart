import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [],
              ),
            ),
            ListTile(
              leading: Icon(Icons.widgets),
              title: Text("Menu options"),
            ),
            ListTile(
              leading: Icon(Icons.loop),
              title: Text("Refunds"),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Transactions"),
            ),
            ListTile(
              leading: Icon(Icons.tune),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
