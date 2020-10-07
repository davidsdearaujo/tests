import 'package:flutter/material.dart';
import 'package:gov_scrapy/home_tile.dart';
import 'package:gov_scrapy/models/posts_group.dart';
import 'package:sticky_infinite_list/sticky_infinite_list.dart';
import 'package:sticky_infinite_list/widget.dart';

import 'home_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final repository = HomeRepository();
  Future<List<PostsGroup>> future;

  @override
  void initState() {
    super.initState();
    future = repository.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("saude.gov.br - Notícias"),
      ),
      body: FutureBuilder<List<PostsGroup>>(
        future: future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () async {
              future = repository.getData();
              await future;
            },
            child: InfiniteList(
              posChildCount: snapshot.data.length,
              builder: (context, index) {
                final currentGroup = snapshot.data[index];
                return InfiniteListItem(
                  crossAxisAlignment: HeaderCrossAxisAlignment.center,
                  mainAxisAlignment: HeaderMainAxisAlignment.start,

                  // initialHeaderBuild: true,
                  minOffsetProvider: (state) => 50,
                  // headerStateBuilder: (context, state) {
                  //   return Container(
                  //     alignment: Alignment.center,
                  //     width: double.infinity,
                  //     height: 50,
                  //     child: Text("Header $index"),
                  //     color: Colors.orange.withOpacity(state.position),
                  //   );
                  // },
                  headerBuilder: (BuildContext context) {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50)),
                        // color: Colors.orange.withOpacity(state.position),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          currentGroup.date,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontSize: 15),
                        ),
                      ),
                    );
                  },
                  contentBuilder: (BuildContext context) {
                    return Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Divider(color: Colors.black),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: currentGroup.posts.length,
                          itemBuilder: (context, index) {
                            return HomeTile(currentGroup.posts[index]);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
