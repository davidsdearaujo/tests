import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final List<Widget> buttons;

  const BottomBarWidget({Key key, List<Widget> buttons})
      : buttons = buttons ?? const <Widget>[],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight < constraints.maxWidth) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 75,
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Material(
                      elevation: 10,
                      child: Container(
                        color: Theme.of(context).bottomAppBarColor,
                        width: 47,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: buttons,
                  ),
                )
              ],
            ),
          ),
        );
      }
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 75,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Material(
                    elevation: 10,
                    child: Container(
                      color: Theme.of(context).bottomAppBarColor,
                      height: 47,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: buttons,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
