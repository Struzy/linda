import 'package:flutter/material.dart';
import 'package:linda/screens/main_screen.dart';
import 'screens/splash_screen.dart';

void main() => runApp(
  const Linda(),
);

class Linda extends StatelessWidget {
  const Linda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF559A56),
        scaffoldBackgroundColor: const Color(0xFF7DAB76),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        MainScreen.id: (context) => const MainScreen(),
      },
    );
  }
}
