import 'package:animation/routes.dart';
import 'package:flutter/material.dart';

import 'controller/theme_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galaxy Planets Animator',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      routes: Routes.instance.routes,
    );
  }
}
