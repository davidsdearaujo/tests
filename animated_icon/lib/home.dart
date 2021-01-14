import 'dart:math';

import 'package:flutter/material.dart';

import 'simple_filters/simple_filters_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste Animated Icon"),
      ),
      body: Column(
        children: [
          SimpleFiltersWidget(
            selectedIndex: index,
            onIndexChanged: (i) => index = i,
          ),
          Expanded(
            child: Center(
              child: RaisedButton.icon(
                onPressed: () {
                  setState(() {
                    final random = Random();
                    int value;
                    do {
                      value = Random().nextInt(4)-1;
                    } while (value == index);
                    index = value;
                  });
                },
                icon: Icon(Icons.accessible),
                label: Text("Change"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
