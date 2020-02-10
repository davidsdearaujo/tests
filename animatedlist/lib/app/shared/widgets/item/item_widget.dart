import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String text;
  final Animation<double> animation;
  final VoidCallback onTap;

  const ItemWidget(
    this.text,
    this.animation, {
    this.onTap,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(title: Text(text), onTap: onTap),
    );
  }
}
