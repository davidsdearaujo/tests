import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => state = !state),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: state ? Colors.blue : Colors.green,
        width: state ? 50 : 150,
        height: state ? 50 : 150,
      ),
    );
  }
}
