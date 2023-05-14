import 'package:flutter/material.dart';
import 'package:linda/classes/daytime_list.dart';
import 'dart:math';
import 'package:linda/classes/image_path.dart';
import 'package:linda/classes/image_list.dart';
import 'package:linda/classes/saying.dart';
import 'package:linda/classes/saying_list.dart';
import 'package:linda/constants/color.dart';
import '../constants/font_family.dart';
import '../constants/font_size.dart';
import '../constants/image.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String id = 'main_screen';

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> refresh() async {
    Navigator.pushNamed(context, MainScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: RefreshIndicator(
            key: refreshIndicatorKey,
            color: Colors.black,
            backgroundColor: kPrimaryColor,
            strokeWidth: 4.0,
            onRefresh: refresh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Text(
                    getGreeting(),
                    style: const TextStyle(
                      fontSize: kFontsizeSubtitle,
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Einen wunderschönen Tag Dir!',
                    style: TextStyle(
                      fontSize: kFontsizeSubtitle,
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
                const Divider(
                  color: Colors.black54,
                  thickness: 3.0,
                ),
                Center(
                  child: Text(
                    '${getSaying().text} - ${getSaying().author}',
                    style: const TextStyle(
                      fontSize: kFontsizeQuote,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black54,
                  thickness: 3.0,
                  endIndent: 75.0,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            refreshIndicatorKey.currentState?.show();
          },
          foregroundColor: Colors.black,
          backgroundColor: kPrimaryColor,
          child: const Icon(
            Icons.refresh,
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

    if (daytimes.daytimeList.first.now.hour >=
            daytimes.daytimeList.first.morningBegin.hour &&
        daytimes.daytimeList.first.now.hour <
            daytimes.daytimeList.first.morningEnd.hour) {
      greeting = 'Guten Morgen';
    } else if (daytimes.daytimeList.first.now.hour >=
            daytimes.daytimeList.first.forenoonBegin.hour &&
        daytimes.daytimeList.first.now.hour <
            daytimes.daytimeList.first.forenoonEnd.hour) {
      greeting = 'Guten Vormittag';
    } else if (daytimes.daytimeList.first.now.hour >=
            daytimes.daytimeList.first.noonBegin.hour &&
        daytimes.daytimeList.first.now.hour <
            daytimes.daytimeList.first.noonEnd.hour) {
      greeting = 'Guten Mittag';
    } else if (daytimes.daytimeList.first.now.hour >=
            daytimes.daytimeList.first.afternoonBegin.hour &&
        daytimes.daytimeList.first.now.hour <
            daytimes.daytimeList.first.afternoonEnd.hour) {
      greeting = 'Guten Nachmittag';
    } else if (daytimes.daytimeList.first.now.hour >=
            daytimes.daytimeList.first.eveningBegin.hour &&
        daytimes.daytimeList.first.now.hour <
            daytimes.daytimeList.first.eveningEnd.hour) {
      greeting = 'Guten Abend';
    } else if (daytimes.daytimeList.first.now.hour >=
            daytimes.daytimeList.first.nightBegin.hour &&
        daytimes.daytimeList.first.now.hour <
            daytimes.daytimeList.first.nightEnd.hour) {
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
