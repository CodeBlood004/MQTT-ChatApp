import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mqtt_chat_app/const/color.dart';
import 'package:mqtt_chat_app/const/image.dart';
import 'package:mqtt_chat_app/const/imports.dart';
import 'package:mqtt_chat_app/views/Message%20Screen/message_screen.dart';
import 'package:mqtt_chat_app/views/brokerScreen.dart';
import 'package:mqtt_chat_app/views/profile%20screen/profile_screen.dart';
import 'package:mqtt_chat_app/views/splash/splash.dart';
import 'package:page_transition/page_transition.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
          inputDecorationTheme: const InputDecorationTheme(
              focusedBorder:OutlineInputBorder(
                borderSide: BorderSide(color: Vx.black),
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10.0), topRight:Radius.circular(10.0) ),
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
          )
        )
      ),
      home:  ProfileScreen(),
      // home: AnimatedSplashScreen(
      //     splash: Image.asset(appLogoWithName),
      //     splashIconSize: 250,
      //     duration: 1500,
      //     backgroundColor: lightGray,
      //     splashTransition: SplashTransition.fadeTransition,
      //     pageTransitionType: PageTransitionType.leftToRight,
      //
      //     nextScreen:const BrokerScreen()
      // ),
    );
  }
}
