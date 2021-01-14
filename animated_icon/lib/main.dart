import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

abstract class DefaultTheme {
  static const headlineColor = const Color(0xFF8A8C8E);
  static const backgroundColor = const Color(0xFFF5F5F5);
  static const foregroundColor = const Color(0xFF2F333A);
  static const backgroundSecondaryColor = const Color(0xFFE5E5E5);
  static const foregroundSecondaryColor = const Color(0xFFC5C5C5);
}
