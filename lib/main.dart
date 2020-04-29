import 'package:covid19/contant.dart';
import 'package:covid19/homeScreen.dart';
import 'package:covid19/infoContainer.dart';
import 'package:covid19/myHeader.dart';
import 'package:covid19/statesInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'counter.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: myBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(body1: TextStyle(color: myBodyTextColor))),
          initialRoute: '/',
          routes: {
            '/': (context)=> HomeScreen(),
            '/statewise':(context)=> StatesWiseInfo(),
            '/precautions':(context)=> InfoContent(),
          },
    );
  }
}





