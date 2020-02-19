import 'package:flutter/material.dart';

import 'header_delegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: false,
            delegate: DynamicSliverHeaderDelegate(
              maxHeight: 256,
              minHeight: 186,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 256,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillViewport(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.only(top: 100),
                  color: Colors.green.withOpacity(0.2),
                  child: Column(
                    children: <Widget>[
                      Text('TODO... A construir'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
