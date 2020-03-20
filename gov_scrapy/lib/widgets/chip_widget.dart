import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final Widget child;

  const ChipWidget({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: 12,
        color: Theme.of(context).primaryIconTheme.color,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: child,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
