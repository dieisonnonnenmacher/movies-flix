import 'package:movies_flix/landing_page.dart';
import 'package:movies_flix/login.dart';

final routes = {
  '/': (context) => LandingPage(),
  '/login': (context) {
    return Login();
  },
  // '/singnup': (context) {
  //   return SingnUp();
  // },
};
