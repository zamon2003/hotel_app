import 'package:flutter/material.dart';
import 'package:task_for_4_may/pages/SignUp.dart';
import 'package:task_for_4_may/pages/get_started.dart';
import 'package:task_for_4_may/pages/homepage.dart';
import 'package:task_for_4_may/pages/hotel_screen.dart';
import 'package:task_for_4_may/pages/hotels.dart';
import 'package:task_for_4_may/pages/login_page.dart';
import 'package:task_for_4_may/pages/page_scroll.dart';
import 'package:task_for_4_may/pages/splash_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '10 ta page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SplashPage(),
      routes: {
        LoginPage.id: (context) => LoginPage(),
        PageScroll.id: (context) => PageScroll(),
        SignUp.id: (context) => SignUp(),
        SplashPage.id: (context) => SplashPage(),
        GetStartedPage.id: (context) => GetStartedPage(),
        HomePage.id: (context) => HomePage(),
        Hotels.id: (context) => Hotels(),
        HotelScreen.id: (context) => HomePage(),
      },
    );
  }
}
