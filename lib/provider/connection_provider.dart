import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test/models/register.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/connection_response.dart';

class ConnectionProvider extends ChangeNotifier {
  late final WebSocketChannel _websocket;

  String _url = "";
  String get url => _url;
  dynamic presets;

  setUrl(String url) {
    _url = url;
    notifyListeners();
  }

  void startStream() {
    _websocket = WebSocketChannel.connect(
      Uri.parse(url),
    );
  }

  Stream<ConnectionResponse> get presetStream => _websocket.stream
      .map<ConnectionResponse>(
          (value) => ConnectionResponse.fromJson(jsonDecode(value)))
      .skipWhile((element) => element.presets != presets);

  void registerPreset({
    required String name,
  }) {
    _websocket.sink.add(
      jsonEncode(
        Register({
          "MessageName": "$name.register",
          "Parameters": {"PresetName": name}
        }).toJson(),
      ),
    );
  }
    void fetchPreset(

  ) {
    _websocket.sink.add(
""
    );
  }


  void unregisterPreset({
    required String name,
  }) {
    _websocket.sink.add(
      jsonEncode(
        Register({
          "MessageName": "$name.unregister",
          "Parameters": {"PresetName": name}
        }).toJson(),
      ),
    );
  }

  void closeBitcoin() {
    _websocket.sink.close();
  }
}
