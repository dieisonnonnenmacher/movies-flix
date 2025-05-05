import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_flix/pages/favorites_page.dart';
import 'package:movies_flix/pages/home_page.dart';
import 'package:movies_flix/pages/landing_page.dart';
import 'package:movies_flix/pages/login_page.dart';
import 'package:movies_flix/pages/signup_page.dart';

final routes = GoRouter(
  initialLocation: LandingPage.route,
  routes: [
    GoRoute(
      name: 'signup',
      path: SignUp.route,
      builder: (context, state) => SignUp(),
    ),
    GoRoute(
      name: 'login',
      path: Login.route,
      builder: (context, state) => Login(),
    ),
    GoRoute(
      path: LandingPage.route,
      builder: (context, state) => LandingPage(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            currentIndex: _getIndexFromLocation(state.uri.toString()),
            onTap: (index) {
              final locations = [HomePage.route, FavoritesPage.route];
              context.go(locations[index]);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favorites',
              ),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          name: 'home',
          path: HomePage.route,
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          name: 'favorites',
          path: FavoritesPage.route,
          builder: (context, state) => FavoritesPage(),
        ),
      ],
    ),
  ],
);

int _getIndexFromLocation(String location) {
  if (location.startsWith(HomePage.route)) return 0;
  if (location.startsWith(FavoritesPage.route)) return 1;
  return 0;
}
