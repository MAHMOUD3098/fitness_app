import 'package:carousel_slider/carousel_controller.dart';
import 'package:fitness_app/modules/login/login_screen.dart';
import 'package:fitness_app/modules/signup/cubit/states.dart';
import 'package:fitness_app/modules/signup/goals_screen.dart';
import 'package:fitness_app/shared/components/constants.dart';
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
        carouselIndex++,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );
    }
    emit(AnimateToNextCarouselItemState());
  }

  void goToLoginScreen(BuildContext context) {
    navigateTo(context, LoginScreen());
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
