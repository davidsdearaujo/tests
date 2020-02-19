import 'package:mobx/mobx.dart';
part 'firebase_messaging_receive_store.g.dart';

class FirebaseMessagingReceiveStore = _FirebaseMessagingReceiveStoreBase
    with _$FirebaseMessagingReceiveStore;

abstract class _FirebaseMessagingReceiveStoreBase with Store {
  @observable
  Map<String, dynamic> notification = {};

  @action
  void addNotification(Map<String, dynamic> newData) {
    notification = newData;
  }
}