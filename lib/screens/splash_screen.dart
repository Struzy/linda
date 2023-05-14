import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String id = 'splash_screen';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(
      const Duration(seconds: 5),
      () => navigateToMainScreen(),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset(
                'animations/reveal_loading.json',
                width: 300,
                height: 300,
              ),
              Lottie.asset(
                'animations/loading_text.json',
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // After displaying the lottie animation for the desired duration one will be
  // directed to the main screen
  void navigateToMainScreen() {
    Navigator.pushNamed(context, MainScreen.id);
  }
}
