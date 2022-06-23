import 'package:fitness_app/modules/signup/cubit/cubit.dart';
import 'package:fitness_app/modules/signup/cubit/states.dart';
import 'package:fitness_app/shared/components/components.dart';
import 'package:fitness_app/shared/components/paths.dart';
import 'package:fitness_app/shared/styles/colors.dart';
import 'package:fitness_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalItem {
  final String goalImage;
  final String goalTitle;
  final String goalSubtitle;

  GoalItem(this.goalImage, this.goalTitle, this.goalSubtitle);
}

class GoalScreen extends StatelessWidget {
  GoalScreen({Key? key}) : super(key: key);

  List<GoalItem> goals = [
    GoalItem(Paths.goal1Image, 'Improve Shape', 'I have a low amount of body fat and need / want to build more muscle'),
    GoalItem(Paths.goal2Image, 'Lean & Tone', 'I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way'),
    GoalItem(Paths.goal3Image, 'Lose a Fat', 'I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass'),
  ];
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          SignUpCubit signUpCubit = SignUpCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'What is your goal ?',
                          style: h4TextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 90),
                          child: Text(
                            'It will help us to choose a best program for you',
                            style: smallTextStyle.copyWith(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 2,
                      child: CarouselSlider.builder(
                        carouselController: carouselController,
                        itemCount: 3,
                        itemBuilder: (context, itemIdex, pageViewIndex) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
                            decoration: BoxDecoration(
                              gradient: blueLinear,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Image.asset(goals[itemIdex].goalImage),
                                  Text(goals[itemIdex].goalTitle),
                                  Text(goals[itemIdex].goalSubtitle),
                                ],
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: (index, carouselPageChangedReason) {},
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    customTextButton(
                      text: 'Confirm',
                      textStyle: mediumTextStyle.copyWith(color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
                      onPressed: () {
                        signUpCubit.animateToNextCarouselItem(carouselController, goals);
                      },
                      gradientColor: blueLinear,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
