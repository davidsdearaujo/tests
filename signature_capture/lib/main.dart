import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:signature_capture/signature/signature_widget.dart';
import 'signature/signature.dart';

import 'bottom_bar/bottom_bar_widget.dart';
import 'bottom_bar_button/bottom_bar_button_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignatureWidget(),
    );
  }
}
