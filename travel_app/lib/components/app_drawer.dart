import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text("DD"),
                    ),
                    Text("Dario D'Agnelli"),
                  ],
                ),
              ),
              ListTile(
                onTap: () => Navigator.of(context).popAndPushNamed("/home"),
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                onTap: () => Navigator.of(context).popAndPushNamed("/profile"),
                leading: Icon(Icons.person),
                title: Text("Account"),
              ),
              ListTile(
                onTap: () => Navigator.of(context).popAndPushNamed("/favorite"),
                leading: Icon(Icons.star),
                title: Text("Favorite"),
              ),
              ListTile(
                onTap: () => Navigator.of(context).popAndPushNamed("/mete"),
                leading: Icon(Icons.travel_explore),
                title: Text("Global search"),
              ),
              ListTile(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setBool('loggato', false);
                  Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                },
                leading: Icon(Icons.person),
                title: Text("Logout"),
              ),
            ],
          )),
    );
  }
}
