import 'package:movies_flix/landing_page.dart';
import 'package:movies_flix/login.dart';
import 'package:movies_flix/signup.dart';

final routes = {
  '/': (context) => LandingPage(),
  '/login': (context) {
    return Login();
  },
  '/signup': (context) {
    return SignUp();
  },
};
