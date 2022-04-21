import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Icon(Icons.pin_drop, color: Colors.blue, ),
            Text("Italia")
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text("DD"),
          )
        ],
      ),
    );
  }
}
