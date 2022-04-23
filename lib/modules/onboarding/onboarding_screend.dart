import 'package:fitness_app/shared/components/components.dart';
import 'package:fitness_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../shared/utilities/paths.dart';

class BoardingModel {
  final String title;
  final String description;
  final String image;

  BoardingModel(this.title, this.description, this.image);
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController onBoardingPageController = PageController();
  double percent = 0.25;
  bool isLastBoardingScreen = false;

  List<BoardingModel> screens = [
    BoardingModel(
      'Track Your Goal',
      'Don\'t worry if you have trouble determining your goals, We can help you determine your goals and track your goals',
      Paths.onBoardingImage1,
    ),
    BoardingModel(
      'Get Burn',
      'Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever',
      Paths.onBoardingImage2,
    ),
    BoardingModel(
      'Eat Well',
      'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun',
      Paths.onBoardingImage3,
    ),
    BoardingModel(
      'Improve Sleep Quality',
      'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning',
      Paths.onBoardingImage4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: onBoardingPageController,
                itemCount: screens.length,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == screens.length - 1) {
                    isLastBoardingScreen = true;
                  } else {
                    isLastBoardingScreen = false;
                  }
                  if (index == 0) {
                    percent = 0.25;
                  } else {
                    percent = (index + 1) / 4;
                  }
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return onBoardingScreenItem(
                    context,
                    screens[index].title,
                    screens[index].description,
                    screens[index].image,
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: CircularPercentIndicator(
          radius: 35.0,
          lineWidth: 3.0,
          percent: percent,
          animation: true,
          animationDuration: 500,
          backgroundColor: Colors.transparent,
          animateFromLastPercent: true,
          linearGradient: blueLinear,
          center: Container(
            decoration: BoxDecoration(
              gradient: blueLinear,
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
              enableFeedback: false,
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              highlightElevation: 0.0,
              onPressed: () {
                if (!isLastBoardingScreen) {
                  if (percent < 1) {
                    percent += 0.25;
                    setState(() {});
                    onBoardingPageController.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                } else {
                  // navigate to sign up and login
                }
              },
              child: Image.asset(
                Paths.arrowRight,
                width: 30,
                height: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
