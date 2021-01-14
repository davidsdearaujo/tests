import 'package:flutter/material.dart';

class ControlledAnimation extends StatefulWidget {
  @override
  _ControlledAnimationState createState() => _ControlledAnimationState();
}

class _ControlledAnimationState extends State<ControlledAnimation> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Size> sizeAnimation;
  Animation<Color> colorAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    sizeAnimation = SizeTween(
      begin: Size(50, 50),
      end: Size(150, 150),
    ).animate(controller);

    colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.green,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final isForwardAnimating = [AnimationStatus.forward, AnimationStatus.completed].contains(controller.status);
        if (isForwardAnimating) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, snapshot) {
          return Container(
            width: sizeAnimation.value.width,
            height: sizeAnimation.value.height,
            color: colorAnimation.value,
          );
        },
      ),
    );
  }
}
