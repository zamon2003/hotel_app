import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_for_4_may/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  static const String id = 'splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: MediaQuery.of(context).size.height,
        splash: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              colors: [
                Colors.blue.withOpacity(0.4),
                Colors.blue.withOpacity(0.2),
                Colors.blue.withOpacity(0.1),
                Colors.blue.withOpacity(0.1),
              ],
            ),
          ),
          child: Lottie.asset('assets/jison.json'),
        ),
        // splashTransition: SplashTransition.rotationTransition,
        // pageTransitionType: PageTransitionType.topToBottom,
        nextScreen: GetStartedPage(),
      ),
    );
  }
}
