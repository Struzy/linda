import 'package:flutter/material.dart';
import 'package:linda/classes/daytime_list.dart';
import 'dart:math';
import 'package:linda/classes/image_path.dart';
import 'package:linda/classes/image_list.dart';
import 'package:linda/classes/saying.dart';
import 'package:linda/classes/saying_list.dart';
import '../constants/font_family.dart';
import '../constants/font_size.dart';
import '../constants/image.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const String id = 'main_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Text(
                  getGreeting(),
                  style: const TextStyle(
                    fontFamily: kSourceSansPro,
                    fontSize: kFontsizeSubtitle,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Linda Broghammer',
                  style: TextStyle(
                    fontFamily: kPacifico,
                    fontSize: kFontsizeTitle,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Einen wunderschönen Tag Dir!',
                  style: TextStyle(
                    fontFamily: kSourceSansPro,
                    fontSize: kFontsizeSubtitle,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CircleAvatar(
                radius: kRadius,
                backgroundImage: AssetImage(
                  getImagePath().path,
                ),
              ),
              Center(
                child: Text(
                  '${getSaying().text} - ${getSaying().author}',
                  style: const TextStyle(
                    fontFamily: kSourceSansPro,
                    fontSize: kFontsizeQuote,
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

  // Generate a random number within the provided number of images and return
  // its value
  int getRandomNumber(int number) {
    int value = Random().nextInt(number);
    return value;
  }

  // Create an object of DaytimeList and return the greeting with respect to the
  // daytime
  String getGreeting() {
    DaytimeList daytimes = DaytimeList();

    String greeting = '';

    if (daytimes.daytimeList.first.now.hour >= daytimes.daytimeList.first.morningBegin.hour &&
        daytimes.daytimeList.first.now.hour < daytimes.daytimeList.first.morningEnd.hour) {
      greeting = 'Guten Morgen';
    } else if (daytimes.daytimeList.first.now.hour >= daytimes.daytimeList.first.forenoonBegin.hour &&
        daytimes.daytimeList.first.now.hour < daytimes.daytimeList.first.forenoonEnd.hour) {
      greeting = 'Guten Vormittag';
    } else if (daytimes.daytimeList.first.now.hour >= daytimes.daytimeList.first.noonBegin.hour &&
        daytimes.daytimeList.first.now.hour < daytimes.daytimeList.first.noonEnd.hour) {
      greeting = 'Guten Mittag';
    } else if (daytimes.daytimeList.first.now.hour >= daytimes.daytimeList.first.afternoonBegin.hour &&
        daytimes.daytimeList.first.now.hour < daytimes.daytimeList.first.afternoonEnd.hour) {
      greeting = 'Guten Nachmittag';
    } else if (daytimes.daytimeList.first.now.hour >= daytimes.daytimeList.first.eveningBegin.hour &&
        daytimes.daytimeList.first.now.hour < daytimes.daytimeList.first.eveningEnd.hour) {
      greeting = 'Guten Abend';
    } else if (daytimes.daytimeList.first.now.hour >= daytimes.daytimeList.first.nightBegin.hour &&
        daytimes.daytimeList.first.now.hour < daytimes.daytimeList.first.nightEnd.hour) {
      greeting = 'Gute Nacht';
    }

    return greeting;
  }

  // Create an object of type ImagePath and return a random one
  ImagePath getImagePath() {
    ImageList images = ImageList();

    return images.imgList[getRandomNumber(images.imgList.length)];
  }

  // Create an object of type SayingList and return a random one
  Saying getSaying() {
    SayingList sayings = SayingList();

    return sayings.sayingList[getRandomNumber(sayings.sayingList.length)];
  }
}
