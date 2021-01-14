import 'package:flutter/material.dart';
import 'animated_toggle_icon/animated_toggle_icon.dart';
import 'simple_filters_item_model.dart';

class SimpleFiltersWidget extends StatefulWidget {
  ///### Callback to selected button index
  ///
  ///*returns __-1__ to none*
  final void Function(int) onIndexChanged;
  final int selectedIndex;
  const SimpleFiltersWidget({
    Key key,
    this.onIndexChanged,
    this.selectedIndex,
  }) : super(key: key);
  @override
  _SimpleFiltersWidgetState createState() => _SimpleFiltersWidgetState();
}

class _SimpleFiltersWidgetState extends State<SimpleFiltersWidget> {
  int currentFilterIndex;

  @override
  void initState() {
    super.initState();
    currentFilterIndex = widget.selectedIndex ?? -1;
  }

  @override
  void didUpdateWidget(covariant SimpleFiltersWidget oldWidget) {
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      setState(() {
        currentFilterIndex = widget.selectedIndex;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  final items = <SimpleFiltersItemModel>[
    SimpleFiltersItemModel(
      color: Colors.purpleAccent,
      icon: Icons.location_on_outlined,
      backIcon: Icons.location_on,
      title: "+ Proximas",
    ),
    SimpleFiltersItemModel(
      color: Colors.green,
      icon: Icons.flag_outlined,
      backIcon: Icons.flag,
      title: "Participando",
    ),
    SimpleFiltersItemModel(
      color: Colors.amber,
      icon: Icons.star_border_rounded,
      backIcon: Icons.star_rounded,
      title: "Favoritas",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.from(items.asMap().entries.map(
        (entry) {
          final index = entry.key;
          final item = entry.value;

          return Expanded(
            child: AnimatedToggleIcon(
              selectedValue: currentFilterIndex == index,
              color: item.color,
              icon: item.icon,
              backIcon: item.backIcon,
              title: item.title,
              onChanged: (selected) {
                if (selected) {
                  setState(() => currentFilterIndex = index);
                  widget.onIndexChanged?.call(index);
                } else {
                  widget.onIndexChanged?.call(-1);
                }
              },
            ),
          );
        },
      )),
    );
  }
}
