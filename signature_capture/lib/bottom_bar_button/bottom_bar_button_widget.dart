import 'package:flutter/material.dart';

class BottomBarButtonWidget extends StatelessWidget {
  final String heroTag;
  final Widget icon;
  final VoidCallback onPressed;
  final bool mini;

  const BottomBarButtonWidget({
    Key key,
    this.heroTag,
    this.icon,
    this.onPressed,
    bool mini,
  })  : mini = mini ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(size: mini ? 20 : 25),
      child: FloatingActionButton(
        elevation: 10,
        heroTag: heroTag,
        onPressed: onPressed,
        mini: mini,
        child: icon,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
