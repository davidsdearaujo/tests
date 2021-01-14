import 'package:flutter/material.dart';

import 'animation_deivao.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: OpenContainer(
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        transitionDuration: Duration(seconds: 2),
        closedBuilder: (context, func) {
          return Container(
            width: 50,
            height: 50,
            color: Colors.blue,
            child: Hero(
              tag: "Teste de hero nessa porra",
              child: Material(
                child: Image.network(
                  "https://uploads.metropoles.com/wp-content/uploads/2020/02/20143222/Mc-Bin-Laden-2.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              ),
            ),
          );
        },
        openBuilder: (context, func) {
          return Container(
            width: 400,
            height: 400,
            color: Colors.red,
            child: Hero(
              tag: "Teste de hero nessa porra",
              child: Material(
                child: Image.network(
                  "https://uploads.metropoles.com/wp-content/uploads/2020/02/20143222/Mc-Bin-Laden-2.jpg",
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
