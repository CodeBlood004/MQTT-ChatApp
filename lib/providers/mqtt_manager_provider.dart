import 'package:flutter/material.dart';
import 'package:mqtt_chat_app/controllers/MQTTManager.dart';

class MQTTManagerProvider with ChangeNotifier {
  MQTTManager? _manager;

  MQTTManager? get manager => _manager;

  void setManager(MQTTManager manager) {
    _manager = manager;
    notifyListeners();
  }
}
