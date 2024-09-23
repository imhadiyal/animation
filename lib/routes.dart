import 'package:animation/pages/HomePage/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  static final Routes instance = Routes._();
  final String home = '/';
  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => PlanetListScreen(),
  };
}
