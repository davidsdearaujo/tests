import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../bottom_bar/bottom_bar_widget.dart';
import '../bottom_bar_button/bottom_bar_button_widget.dart';
import 'signature.dart';

class SignatureWidget extends StatefulWidget {
  @override
  _SignatureWidgetState createState() => _SignatureWidgetState();
}

class _SignatureWidgetState extends State<SignatureWidget> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print("Value changed"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Signature(
            controller: _controller,
            backgroundColor: Colors.white,
          ),
          BottomBarWidget(
            buttons: [
              BottomBarButtonWidget(
                mini: true,
                heroTag: "back-button",
                icon: Icon(Icons.keyboard_arrow_left),
                onPressed: Navigator.of(context).pop,
              ),
              BottomBarButtonWidget(
                heroTag: "ok-button",
                icon: Icon(Icons.save),
                onPressed: onSaveButtonTap,
              ),
              BottomBarButtonWidget(
                mini: true,
                heroTag: "exclude-button",
                icon: Icon(Icons.delete),
                onPressed: () => setState(() => _controller.clear()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<Uint8List> getSignatureImageBytes() async {
    if (_controller.isEmpty) return null;
    var data = await _controller.toPngBytes();
    return data;
  }

  void onSaveButtonTap() {
    getSignatureImageBytes().then((imageBytes) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Container(
                  child: Image.memory(imageBytes),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
