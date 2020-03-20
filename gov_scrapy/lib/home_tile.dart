import 'package:flutter/material.dart';

import 'models/post.dart';
import 'widgets/chip_widget.dart';

class HomeTile extends StatelessWidget {
  final Post model;

  const HomeTile(this.model, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(model.title),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(model.description),
              if (model.tags.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8),
                  child: Wrap(
                    runSpacing: 5,
                    spacing: 5,
                    children: model.tags
                        .map((tag) => ChipWidget(child: Text(tag)))
                        .toList()
                        .cast<Widget>(),
                  ),
                ),
              if (model.subtitle != "")
                Text(
                  model.subtitle,
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
              Text(
                model.time,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        Divider(color: Colors.black)
      ],
    );
  }
}
