import 'package:fitness_app/shared/components/components.dart';
import 'package:fitness_app/shared/components/paths.dart';
import 'package:fitness_app/shared/styles/colors.dart';
import 'package:fitness_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  Paths.welcomeScreenImage,
                ),
                const SizedBox(
                  height: 44,
                ),
                Center(
                  child: Text(
                    'Welcome, Stefani',
                    style: h4TextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Text(
                      'You are all set now, let’s reach your goals together with us',
                      style: smallTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 191,
                ),
                customTextButton(
                  text: 'Go To Home',
                  textStyle: mediumTextStyle.copyWith(color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
                  onPressed: () {},
                  gradientColor: blueLinear,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
