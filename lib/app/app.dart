import 'package:flutter/material.dart';
import 'package:project_test/app/screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // scrollBehavior: const MaterialScrollBehavior().copyWith(overscroll: false),
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
      ),
      home: const HomeScreen(),
    );
  }
}
