import 'package:fitness_app/shared/components/constants.dart';
import 'package:fitness_app/shared/styles/colors.dart';
import 'package:fitness_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: blueLinear,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 35,
              horizontal: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Fitnest',
                            style: titleTextStyle.copyWith(fontSize: 60),
                          ),
                          TextSpan(
                            text: 'X',
                            style: titleTextStyle.copyWith(fontSize: 75, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Everybody Can Train',
                      style: TextStyle(color: gray_1),
                    ),
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
                    backgroundColor: MaterialStateProperty.all(whiteColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: whiteColor),
                      ),
                    ),
                  ),
                  onPressed: () {
                    navigateTo(context, const OnBoardingScreen());
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      foreground: Paint()
                        ..shader = blueLinear.createShader(
                          const Rect.fromLTWH(0.0, 00.0, 200.0, 70.0),
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
