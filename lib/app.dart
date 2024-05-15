import 'package:expocrato_2024/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: '?????',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: const AppBarTheme(
          color: Colors.indigo,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}
