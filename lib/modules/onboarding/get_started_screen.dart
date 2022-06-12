import 'package:fitness_app/shared/components/components.dart';
import 'package:fitness_app/shared/components/constants.dart';
import 'package:fitness_app/shared/styles/colors.dart';
import 'package:fitness_app/shared/styles/styles.dart';
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
              vertical: 40,
              horizontal: 30,
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
                            style: h2TextStyle.copyWith(fontSize: 36),
                          ),
                          TextSpan(
                            text: 'X',
                            style: h2TextStyle.copyWith(fontSize: 50, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Everybody Can Train',
                      style: mediumTextStyle.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                customTextButton(
                  text: 'Get Started',
                  backgroundColor: whiteColor,
                  textStyle: TextStyle(
                    foreground: Paint()
                      ..shader = blueLinear.createShader(
                        const Rect.fromLTWH(0.0, 00.0, 200.0, 70.0),
                      ),
                  ),
                  onPressed: () {
                    navigateTo(context, const OnBoardingScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
