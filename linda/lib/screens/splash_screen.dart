import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String id = 'splash_screen';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(
        seconds: 10,
      ),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'animations/splash_animation.json',
        controller: controller,
        height: MediaQuery.of(context).size.height * 100,
        width: MediaQuery.of(context).size.width * 100,
        animate: true,
        onLoaded: (composition) {
          controller
            ..duration = composition.duration
            ..forward().whenComplete(
                  () => Navigator.pushNamed(context, MainScreen.id),
            );
        },
      ),
    );
  }
}
