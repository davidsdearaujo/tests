import 'package:animatedlist/app/modules/home/page1/page1_page.dart';
import 'package:animatedlist/app/modules/home/page2/page2_controller.dart';
import 'package:animatedlist/app/modules/home/page1/page1_controller.dart';
import 'package:animatedlist/app/modules/home/home_controller.dart';
import 'package:animatedlist/app/modules/home/page2/page2_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Page2Controller()),
        Bind((i) => Page1Controller()),
        Bind((i) => HomeController()),
        Bind(
          (i) => GlobalKey<AnimatedListState>(debugLabel: i.params["label"]),
          singleton: false,
        ),
      ];

  @override
  List<Router> get routers => [
        Router('/page1', child: (_, args) => Page1Page()),
        Router('/page2', child: (_, args) => Page2Page()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
