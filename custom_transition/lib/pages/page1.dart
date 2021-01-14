import 'package:flutter/material.dart';

import 'page2.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(color: Colors.blue),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan),
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    
    pageBuilder: (context, animation, secondaryAnimation) {
      return Page2();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      print("${animation.value} -- ${secondaryAnimation.value}");
      var begin = Offset(1, 0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
