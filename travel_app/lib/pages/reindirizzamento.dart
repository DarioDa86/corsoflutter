import 'package:flutter/material.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reindirizzamento extends StatefulWidget {
  const Reindirizzamento({Key? key}) : super(key: key);

  @override
  State<Reindirizzamento> createState() => _ReindirizzamentoState();
}

class _ReindirizzamentoState extends State<Reindirizzamento> {

  bool loggato= false;

  void initializeSharedPreferences() async{
    SharedPreferences  sp = await SharedPreferences.getInstance();
    setState(() {
      loggato = sp.getBool('loggato') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return loggato ? const Home() : LoginPage();
  }
}
