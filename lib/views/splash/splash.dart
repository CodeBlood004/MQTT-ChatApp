
import 'package:mqtt_chat_app/const/image.dart';
import 'package:mqtt_chat_app/const/imports.dart';
import 'package:mqtt_chat_app/views/brokerScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    // _navigateToBroker();
    super.initState();
  }
  void _navigateToBroker() async {
    await Future.delayed(const Duration(milliseconds: 1500), (){});

    Get.to( const BrokerScreen());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Image.asset(appLogoWithName,height: 1000 , width: 1000,).box.make().centered(),

      ),

    );
  }


}

