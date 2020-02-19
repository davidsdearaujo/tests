import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'firebase_messaging_receive_store.dart';

mixin FirebaseMessagingReceiveMixin<T extends StatefulWidget> on State<T> {
  var fbMsg = FirebaseMessaging();
  final FirebaseMessagingReceiveStore _store = Modular.get();

  void initState() {
    fbMsg.configure(
      onLaunch: (Map<String, dynamic> msg) async {
        debugPrint("onLaunch called");
      },
      onResume: (Map<String, dynamic> msg) async {
        debugPrint("onResume called");
        // var notificacao = NotificationDisplayModel.fromJson(
        //   json.decode(msg["notificacao"]),
        // );
        // bloc.adicionarNotificacao(notificacao);
        _store.addNotification(msg);
      },
      onMessage: (Map<String, dynamic> msg) async {
        debugPrint("onMessage called");
        // var notification = NotificationDisplayModel.fromJson(
        //   json.decode(msg["data"]["notificacao"]),
        // );
        _store.addNotification(msg["data"]);
        debugPrint(msg.toString());
      },
    );
    fbMsg.requestNotificationPermissions(
      const IosNotificationSettings(
        sound: true,
        alert: true,
        badge: true,
      ),
    );

    fbMsg.onIosSettingsRegistered.listen(
      (setting) => print("IOS Setting Registered"),
    );

    fbMsg.getToken().then((token) => update(token));
    super.initState();
  }

  void update(String token) {
    debugPrint(token);
  }
}
