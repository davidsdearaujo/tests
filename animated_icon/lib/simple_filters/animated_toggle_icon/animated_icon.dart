import 'package:flutter/material.dart';

class AnimatedIcon extends StatefulWidget {
  final Duration duration;
  final IconData icon;
  final double size;
  final Color color;

  const AnimatedIcon({
    Key key,
    this.size,
    this.color,
    @required this.icon,
    @required this.duration,
  }) : super(key: key);

  @override
  _AnimatedIconState createState() => _AnimatedIconState();
}

class _AnimatedIconState extends State<AnimatedIcon>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> colorAnimation;
  Animation<double> sizeAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = AnimationController(vsync: this, duration: widget.duration);
    colorAnimation = ColorTween(
      begin: widget.color,
      end: widget.color,
    ).animate(controller);

    sizeAnimation = Tween(
      begin: widget.size,
      end: widget.size,
    ).animate(controller);
  }

  @override
  void didUpdateWidget(covariant AnimatedIcon oldWidget) {
    final isColorTransition = oldWidget.color != widget.color;
    final isSizeTransition = oldWidget.size != widget.size;
    if (isColorTransition) {
      colorAnimation = ColorTween(
        begin: oldWidget.color,
        end: widget.color,
      ).animate(controller);
    }
    if (isSizeTransition) {
      sizeAnimation = Tween(
        begin: oldWidget.size,
        end: widget.size,
      ).animate(controller);
    }
    if (isColorTransition || isSizeTransition) {
      controller.reset();
      controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, snapshot) {
        return Icon(
          widget.icon,
          size: sizeAnimation.value,
          color: colorAnimation.value,
        );
      },
    );
  }
}
