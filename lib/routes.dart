import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_flix/pages/favorites_page.dart';
import 'package:movies_flix/pages/home_page.dart';
import 'package:movies_flix/pages/landing_page.dart';
import 'package:movies_flix/pages/login_page.dart';
import 'package:movies_flix/pages/movie_page.dart';
import 'package:movies_flix/pages/search_page.dart';
import 'package:movies_flix/pages/settings_page.dart';
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
            selectedItemColor: Colors.green,
            currentIndex: _getIndexFromLocation(state.uri.toString()),
            onTap: (index) {
              final locations = [
                HomePage.route,
                SearchPage.route,
                FavoritesPage.route,
                SettingsPage.route,
              ];
              context.go(locations[index]);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
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
          name: 'search',
          path: SearchPage.route,
          builder: (context, state) => SearchPage(),
        ),
        GoRoute(
          name: 'settings',
          path: SettingsPage.route,
          builder: (context, state) => SettingsPage(),
        ),
        GoRoute(
          name: 'movie_page',
          path: MoviePage.route,
          builder: (context, state) => MoviePage(),
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
  if (location.startsWith(SearchPage.route)) return 1;
  if (location.startsWith(FavoritesPage.route)) return 2;
  if (location.startsWith(SettingsPage.route)) return 3;
  return 0;
}
