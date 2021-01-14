import 'package:flutter/material.dart';
import 'package:open_container/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/modules/home/home_page.dart';

// void main() => runApp(ModularApp(module: AppModule()));
void main() => runApp(
      MaterialApp(
        title: 'Flutter Slidy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
