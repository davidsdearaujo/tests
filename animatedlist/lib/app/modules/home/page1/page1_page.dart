import 'package:animatedlist/app/shared/widgets/item/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Page1Page extends StatefulWidget {
  final String title;
  const Page1Page({Key key, this.title = "Page1"}) : super(key: key);

  @override
  _Page1PageState createState() => _Page1PageState();
}

class _Page1PageState extends State<Page1Page> {
  GlobalKey<AnimatedListState> _key = Modular.get(params: {"label": "page1"});
  final _items = List.generate(50, (i) => "Page 1 - Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Call Page2", textAlign: TextAlign.center),
        onPressed: () => Navigator.of(context).pushNamed("/page2"),
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
