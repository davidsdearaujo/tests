import 'package:animatedlist/app/shared/widgets/item/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Page2Page extends StatefulWidget {
  final String title;
  const Page2Page({Key key, this.title = "Page2"}) : super(key: key);

  @override
  _Page2PageState createState() => _Page2PageState();
}

class _Page2PageState extends State<Page2Page> {
  GlobalKey<AnimatedListState> _key = Modular.get(params: {"label": "page2"});
  final _items = List.generate(50, (i) => "Page 2 - Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: _items.length,
        shrinkWrap: true,
        itemBuilder: (context, index, animation) {
          return AnimatedBuilder(
            animation: animation,
            child: ItemWidget(
              _items[index],
              animation,
              onTap: () {
                final removedItem = _items.removeAt(index);
                _key.currentState.removeItem(
                  index,
                  (context, animation) => ItemWidget(
                    removedItem,
                    animation,
                  ),
                );
              },
            ),
            builder: (context, child) {
              return Align(
                alignment: Alignment.topLeft,
                widthFactor: animation.value,
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
