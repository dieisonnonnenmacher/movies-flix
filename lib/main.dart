import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_flix/landing_page.dart';

import 'routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.getTextTheme(
          'Inter',
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.green,
          onPrimary: Colors.black,
          secondary: Colors.transparent,
          onSecondary: Colors.green,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.black,
          onSurface: Colors.white,
        ),
      ),
      initialRoute: LandingPage.route,
      routes: routes,
    );
  }
}
