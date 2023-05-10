import 'package:flutter/material.dart';
import 'dart:math';
import 'package:linda/classes/image_path.dart';
import 'package:linda/classes/image_list.dart';
import 'package:linda/classes/saying.dart';
import 'package:linda/classes/saying_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const String id = 'main_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Text(
                  getGreeting(),
                  style: const TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Linda Broghammer',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Einen wunderschönen Tag Dir!',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage(
                  getImagePath().path,
                ),
              ),
              Center(
                child: Text(
                  '${getSaying().text} - ${getSaying().author}',
                  style: const TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 12,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int getRandomNumber(int number) {
    int value = Random().nextInt(number);
    return value;
  }

  String getGreeting() {
    final now = DateTime.now();
    final morningBegin = DateTime(now.year, now.month, now.day, 6, 0, 0, 0);
    final morningEnd = DateTime(now.year, now.month, now.day, 10, 0, 0, 0);
    final forenoonBegin = DateTime(now.year, now.month, now.day, 10, 0, 0, 0);
    final forenoonEnd = DateTime(now.year, now.month, now.day, 12, 0, 0, 0);
    final noonBegin = DateTime(now.year, now.month, now.day, 12, 0, 0, 0);
    final noonEnd = DateTime(now.year, now.month, now.day, 14, 0, 0, 0);
    final afternoonBegin = DateTime(now.year, now.month, now.day, 14, 0, 0, 0);
    final afternoonEnd = DateTime(now.year, now.month, now.day, 18, 0, 0, 0);
    final eveningBegin = DateTime(now.year, now.month, now.day, 18, 0, 0, 0);
    final eveningEnd = DateTime(now.year, now.month, now.day, 22, 0, 0, 0);
    final nightBegin = DateTime(now.year, now.month, now.day, 22, 0, 0, 0);
    final nightEnd = DateTime(now.year, now.month, now.day, 6, 0, 0, 0);

    String greeting = '';

    if (now.hour >= morningBegin.hour && now.hour < morningEnd.hour) {
      greeting = 'Guten Morgen';
    } else if (now.hour >= forenoonBegin.hour && now.hour < forenoonEnd.hour) {
      greeting = 'Guten Vormittag';
    } else if (now.hour >= noonBegin.hour && now.hour < noonEnd.hour) {
      greeting = 'Guten Mittag';
    } else if (now.hour >= afternoonBegin.hour &&
        now.hour < afternoonEnd.hour) {
      greeting = 'Guten Nachmittag';
    } else if (now.hour >= eveningBegin.hour && now.hour < eveningEnd.hour) {
      greeting = 'Guten Abend';
    } else if (now.hour >= nightBegin.hour && now.hour < nightEnd.hour) {
      greeting = 'Gute Nacht';
    }

    return greeting;
  }

  ImagePath getImagePath() {
    ImageList images = ImageList();

    return images.imgList[getRandomNumber(images.imgList.length)];
  }

  Saying getSaying() {
    SayingList sayings = SayingList();

    return sayings.sayingList[getRandomNumber(sayings.sayingList.length)];
  }
}
