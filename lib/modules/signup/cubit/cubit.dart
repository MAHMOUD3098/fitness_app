import 'package:carousel_slider/carousel_controller.dart';
import 'package:fitness_app/modules/signup/cubit/states.dart';
import 'package:fitness_app/modules/signup/goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  bool checkBoxIsChecked = false;
  int carouselIndex = 0;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SignUpChangePasswordVisibilityState());
  }

  void changeCheckBoxValue(bool? value) {
    checkBoxIsChecked = value ?? false;
    emit(SignUpChangeCheckBoxValueState());
  }

  void animateToNextCarouselItem(CarouselController carouselController, List<GoalItem> goals) {
    if (carouselIndex < goals.length) {
      carouselController.animateToPage(
        carouselIndex,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );
      carouselIndex++;
      // signUpCubit.incrementCarouselIndex();

      // in last index, the carouselIndex reaches 3 which reflects in goals list
      // so i decrement it by 1 to keep it at 2
      if (carouselIndex == goals.length) carouselIndex--;
    } else {
      // go to login page
    }

    emit(AnimateToNextCarouselItemState());
  }

  void incrementCarouselIndex() {
    carouselIndex++;
    emit(IncrementCarouselIndexState());
  }

  void decrementCarouselIndex() {
    carouselIndex--;
    emit(DecrementCarouselIndexState());
  }
}
