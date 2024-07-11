import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mqtt_chat_app/providers/mqtt_manager_provider.dart';
import 'package:mqtt_chat_app/const/color.dart';
import 'package:mqtt_chat_app/const/image.dart';
import 'package:mqtt_chat_app/const/imports.dart';
import 'package:mqtt_chat_app/views/message%20screen/message_screen.dart';
import 'package:mqtt_chat_app/views/brokerScreen.dart';
import 'package:mqtt_chat_app/views/profile%20screen/profile_screen.dart';
import 'package:mqtt_chat_app/views/splash/splash.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MQTTManagerProvider()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Vx.black),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
            ),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Vx.black,
          ),
          focusColor: Vx.black,
          colorScheme: ColorScheme.fromSeed(seedColor: lightGray),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        home: const  BrokerScreen(),
        // home: AnimatedSplashScreen(
        //     splash: Image.asset(appLogoWithName),
        //     splashIconSize: 250,
        //     duration: 1500,
        //     backgroundColor: lightGray,
        //     splashTransition: SplashTransition.fadeTransition,
        //     pageTransitionType: PageTransitionType.leftToRight,
        //     nextScreen: const BrokerScreen(),
        // ),
      ),
    );
  }
}
