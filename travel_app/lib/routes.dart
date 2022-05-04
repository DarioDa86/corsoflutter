import 'package:flutter/material.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/login_page.dart';
import 'package:travel_app/pages/reindirizzamento.dart';

generateRoutes() {
  return {
    '/': (context) => const Reindirizzamento(),
    '/profile': (context) => const Center(child: Text('Profilo')),
    '/details': (context) => const Center(child: Text('Details')),
    '/favorites': (context) => const Center(child: Text('Preferiti')),
    '/mete': (context) => const Center(child: Text('Mete')),
    '/home': (context) => const Home(),
    '/login': (context) => LoginPage(),
  };
}
