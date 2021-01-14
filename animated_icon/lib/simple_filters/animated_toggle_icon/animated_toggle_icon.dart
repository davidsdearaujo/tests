import 'package:animated_icon/main.dart';
import 'package:flutter/material.dart' hide AnimatedIcon;

import 'animated_icon.dart';

class AnimatedToggleIcon extends StatefulWidget {
  final String title;
  final IconData icon;
  final IconData backIcon;
  final Color color;
  final bool selectedValue;
  final void Function(bool status) onChanged;

  const AnimatedToggleIcon({
    Key key,
    @required this.icon,
    @required this.backIcon,
    this.color = Colors.purple,
    this.selectedValue = false,
    this.onChanged,
    this.title,
  }) : super(key: key);

  @override
  _AnimatedToggleIconState createState() => _AnimatedToggleIconState();
}

class _AnimatedToggleIconState extends State<AnimatedToggleIcon> {
  bool selected = false;
  static const _animationDuration = const Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();
    selected = widget.selectedValue;
  }

  @override
  void didUpdateWidget(covariant AnimatedToggleIcon oldWidget) {
    if (widget.selectedValue != oldWidget.selectedValue) {
      setState(() {
        selected = widget.selectedValue;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() => selected = !selected);
          widget.onChanged?.call(selected);
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: DefaultTheme.backgroundSecondaryColor,
                  width: 2,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    transform: selected
                        ? Matrix4.translationValues(3, 3, 0)
                        : Matrix4.translationValues(0, 0, 0),
                    duration: _animationDuration,
                    child: AnimatedOpacity(
                      duration: _animationDuration,
                      opacity: selected ? 1 : 0,
                      child: AnimatedIcon(
                        duration: _animationDuration,
                        icon: widget.backIcon,
                        size: 30,
                        color: widget.color.withOpacity(0.5),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: _animationDuration,
                    transform: selected
                        ? Matrix4.translationValues(-3, -3, 0)
                        : Matrix4.translationValues(0, 0, 0),
                    child: AnimatedIcon(
                      duration: _animationDuration,
                      icon: widget.icon,
                      color: selected ? widget.color : Color(0xFF9E9E9E),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text(widget.title ?? ""),
          ],
        ),
      ),
    );
  }
}
