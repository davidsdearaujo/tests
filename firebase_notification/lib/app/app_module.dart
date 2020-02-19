import 'package:firebase_notification/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:firebase_notification/app/app_widget.dart';
import 'package:firebase_notification/app/modules/home/home_module.dart';

import 'notification/firebase_messaging_receive_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => FirebaseMessagingReceiveStore()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
