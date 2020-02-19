// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_messaging_receive_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirebaseMessagingReceiveStore
    on _FirebaseMessagingReceiveStoreBase, Store {
  final _$notificationAtom =
      Atom(name: '_FirebaseMessagingReceiveStoreBase.notification');

  @override
  Map<String, dynamic> get notification {
    _$notificationAtom.context.enforceReadPolicy(_$notificationAtom);
    _$notificationAtom.reportObserved();
    return super.notification;
  }

  @override
  set notification(Map<String, dynamic> value) {
    _$notificationAtom.context.conditionallyRunInAction(() {
      super.notification = value;
      _$notificationAtom.reportChanged();
    }, _$notificationAtom, name: '${_$notificationAtom.name}_set');
  }

  final _$_FirebaseMessagingReceiveStoreBaseActionController =
      ActionController(name: '_FirebaseMessagingReceiveStoreBase');

  @override
  void addNotification(Map<String, dynamic> newData) {
    final _$actionInfo =
        _$_FirebaseMessagingReceiveStoreBaseActionController.startAction();
    try {
      return super.addNotification(newData);
    } finally {
      _$_FirebaseMessagingReceiveStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'notification: ${notification.toString()}';
    return '{$string}';
  }
}
