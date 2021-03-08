import 'package:flutter/material.dart';
import 'package:foodie_app/welcome_screen.dart';
import 'package:foodie_app/constants.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intro_screen_onboarding_flutter/circle_progress_bar.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Introduction> list = [
    Introduction(
      imageUrl: "assets/images/screen1.png",
      title: "Welcome to Foodie",
      subTitle: 'Best online food ordering app ',
    ),
    Introduction(
      imageUrl: "assets/images/screen2.png",
      title: "Fast delivery",
      subTitle: 'Safe and Secured delivery',
    ),
    Introduction(
      imageUrl: "assets/images/screen3.png",
      title: "Live Tracking ",
      subTitle: 'On Time Delivery',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Builder(
              builder: (context) => IntroScreenOnboarding(
                introductionList: list,
                onTapSkipButton: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
