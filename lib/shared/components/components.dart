import 'package:fitness_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';

Widget onBoardingScreenItem(BuildContext context, String title, String description, String image) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Image.asset(
        image,
        fit: BoxFit.fill,
      ),
      const SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleTextStyle,
            ),
            Text(
              description,
              style: mediumTextStyle,
            ),
          ],
        ),
      ),
    ],
  );
}
