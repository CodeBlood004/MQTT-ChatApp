import 'package:mqtt_chat_app/const/imports.dart';
import 'package:mqtt_chat_app/model/MQTTAppState.dart';


String connectionStatus (MQTTAppConnectionState state){

  switch (state) {
    case MQTTAppConnectionState.connected:
      return 'DISCONNECT';
    case MQTTAppConnectionState.connecting:
      return 'CONNECTING';
    case MQTTAppConnectionState.disconnected:
      return 'CONNECT';
  }

}