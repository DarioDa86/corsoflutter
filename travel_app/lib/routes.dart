import 'package:flutter/material.dart';
import 'package:travel_app/pages/home.dart';

generateRoutes() {
  return {
    '/' : (context) => const Home(),
    '/profile' : (context) =>Center(child: Text('Profile')),
    '/details' : (context) =>Center(child: Text('Details')),
    '/favorites' : (context) =>Center(child: Text('Favorites')),
    '/mete' : (context) =>Center(child: Text('Mete')),
  };
}