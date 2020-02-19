# Notificações no Flutter
Packages utilizados:
 - [[v6.0.9] Firebase Notification](https://pub.dev/packages/firebase_messaging/versions)
 - [[v1.5.2] Slidy](https://pub.dev/packages/slidy/versions)
 - [[v0.5.1] Flutter Modular](https://pub.dev/packages/flutter_modular)
 - [[v1.0.2] MobX](https://pub.dev/packages/mobx)

O segredo de tudo está na pasta ["lib/app/notification"](lib/app/notification)

Ali temos o Mixin `FirebaseMessagingReceiveMixin`
Coloque ele no seu `AppWidget`, dessa forma:
```dart
class _AppWidgetState extends State<AppWidget> with FirebaseMessagingReceiveMixin {

}
```

Adicione o bind do `FirebaseMessagingReceiveStore` ao `AppModule`:
```dart
class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => FirebaseMessagingReceiveStore()),
      ];
...
```

E aí é só chamar em qualquer lugar com o get do modular:
```dart
final FirebaseMessagingReceiveStore messagingStore = Modular.get();
```
