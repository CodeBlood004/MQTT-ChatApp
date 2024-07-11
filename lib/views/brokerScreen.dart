import 'package:flutter/material.dart';
import 'package:mqtt_chat_app/common%20widgets/custom_button.dart';
import 'package:mqtt_chat_app/common%20widgets/custom_text_field.dart';
import 'package:mqtt_chat_app/views/profile%20screen/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:mqtt_chat_app/controllers/MQTTManager.dart';
import 'package:mqtt_chat_app/providers/mqtt_manager_provider.dart';
import 'package:mqtt_chat_app/model/MQTTAppState.dart';
import 'package:mqtt_chat_app/const/color.dart';
import 'package:mqtt_chat_app/const/image.dart';
import 'package:mqtt_chat_app/const/imports.dart';
import 'package:uuid/uuid.dart';

class BrokerScreen extends StatefulWidget {
  const BrokerScreen({super.key});

  @override
  State<BrokerScreen> createState() => _BrokerScreenState();
}

class _BrokerScreenState extends State<BrokerScreen> {
  final _brokerAddressController = TextEditingController();
  final _topicController = TextEditingController();
  late MQTTAppState currentAppState;

  var uuid = Uuid();
  String prefixTest = '2';

  @override
  void initState() {
    super.initState();
    currentAppState = MQTTAppState();
  }

  void _configureAndConnect() {
    String osPrefix = uuid.v1();
    prefixTest = osPrefix;

    MQTTManager manager = MQTTManager(
      host: _brokerAddressController.text,
      topic: _topicController.text,
      identifier: osPrefix,
      state: currentAppState,
    );

    manager.initializeMQTTClient();
    manager.connect();

    // Set the manager in the provider
    Provider.of<MQTTManagerProvider>(context, listen: false).setManager(manager);

    // Add a listener to the connection state
    currentAppState.addListener(() {
      if (currentAppState.getAppConnectionState == MQTTAppConnectionState.connected) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.to(() => const ProfileScreen(), transition: Transition.rightToLeft);
        });
      }
    });
  }

  void _disconnect() {
    final manager = Provider.of<MQTTManagerProvider>(context, listen: false).manager;
    manager?.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812), minTextAdapt: true, splitScreenMode: true);
    return ChangeNotifierProvider<MQTTAppState>(
      create: (_) => currentAppState,
      child: Scaffold(
        backgroundColor: lightGray,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Center(
              child: "Broker Details"
                  .text
                  .fontFamily(bebasNeue).bold
                  .size(30.sp)
                  .make(),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(appLogoWithName),
              ),
              const HeightBox(15),
              const Divider(color: Vx.black, indent: 30, endIndent: 30, thickness: 0),
              const HeightBox(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Broker Address".text.make(),
                  customTextField(hint: "Broker Address", prefixIcon: Icons.location_on, controller: _brokerAddressController),
                  const HeightBox(10),
                  "Broker Topic".text.make(),
                  customTextField(hint: "Topic Name", prefixIcon: Icons.list, controller: _topicController),
                  const HeightBox(20),
                  Consumer<MQTTAppState>(
                    builder: (context, mqttState, child) {
                      String buttonText;
                      VoidCallback buttonAction;
                      Color buttonColor;

                      switch (mqttState.getAppConnectionState) {
                        case MQTTAppConnectionState.connected:
                          buttonText = "DISCONNECT";
                          buttonAction = _disconnect;
                          buttonColor = Colors.red;
                          break;
                        case MQTTAppConnectionState.connecting:
                          buttonText = "CONNECTING...";
                          buttonAction = () {};
                          buttonColor = Colors.grey;
                          break;
                        case MQTTAppConnectionState.disconnected:
                        default:
                          buttonText = "CONNECT";
                          buttonAction = _configureAndConnect;
                          buttonColor = Vx.black;
                          break;
                      }

                      return customButton(
                        title: buttonText,
                        buttonColor: buttonColor,
                        textColor: Vx.white,
                        onPress: buttonAction,
                        padding: (60, 10),
                        fontSize: 15,
                      ).centered();
                    },
                  ),
                ],
              ).paddingSymmetric(horizontal: 20),
            ],
          ).paddingSymmetric(horizontal: 24.w),
        ),
      ),
    );
  }
}
