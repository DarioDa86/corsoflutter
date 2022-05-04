
import 'package:social_app/home.dart';
import 'package:social_app/pages/login.dart';


generateRoutes() {
  return {
    '/login' : (context) => const Login(),
    '/home' : (context) => const Home(),

  };
}