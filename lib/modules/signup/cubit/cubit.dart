import 'package:fitness_app/modules/signup/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  bool checkBoxIsChecked = false;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SignUpChangePasswordVisibilityState());
  }

  void changeCheckBoxValue(bool? value) {
    checkBoxIsChecked = value ?? false;

    emit(SignUpChangeCheckBoxValueState());
  }
}
