import 'package:fitness_app/modules/signup/complete_profile_screen.dart';
import 'package:fitness_app/modules/signup/cubit/cubit.dart';
import 'package:fitness_app/modules/signup/cubit/states.dart';
import 'package:fitness_app/shared/components/components.dart';
import 'package:fitness_app/shared/components/constants.dart';
import 'package:fitness_app/shared/components/paths.dart';
import 'package:fitness_app/shared/lang/english_texts.dart';
import 'package:fitness_app/shared/styles/colors.dart';
import 'package:fitness_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final GlobalKey signUpFormKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SignUpCubit signUpCubit = SignUpCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: whiteColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 30,
                ),
                child: Form(
                  key: signUpFormKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Hey There,',
                          textAlign: TextAlign.center,
                          style: largeTextStyle.copyWith(color: blackColor, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Create an Account',
                          textAlign: TextAlign.center,
                          style: h4TextStyle.copyWith(fontWeight: FontWeight.w700),
                        ),
                        customTextFormField(
                          controller: firstNameController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'please enter your first name';
                              }
                            }
                            return null;
                          },
                          placeHolder: EnglishTexts.texts['firstNamePlaceHolder'],
                          prefixIcon: Paths.profileIcon,
                        ),
                        customTextFormField(
                          controller: lastNameController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'please enter your last name';
                              }
                            }
                            return null;
                          },
                          placeHolder: EnglishTexts.texts['lastNamePlaceHolder'],
                          prefixIcon: Paths.profileIcon,
                        ),
                        customTextFormField(
                          controller: emailController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'please enter your email';
                              }
                            }
                            return null;
                          },
                          placeHolder: EnglishTexts.texts['emailPlaceHolder'],
                          prefixIcon: Paths.emailIcon,
                        ),
                        customTextFormField(
                          controller: passwordController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'please enter your password';
                              }
                            }
                            return null;
                          },
                          placeHolder: EnglishTexts.texts['passwordPlaceHolder'],
                          prefixIcon: Paths.lockIcon,
                          isPassword: signUpCubit.isPassword,
                          suffixIcon: Icon(
                            signUpCubit.suffix,
                            color: gray_2,
                          ),
                          suffixIconPressed: () {
                            SignUpCubit.get(context).changePasswordVisibility();
                          },
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                value: signUpCubit.checkBoxIsChecked,
                                onChanged: (value) {
                                  signUpCubit.changeCheckBoxValue(value);
                                },
                                splashRadius: 0.0, //to disable the splash effect
                                side: BorderSide(color: gray_2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text.rich(
                                TextSpan(
                                  text: 'By continuing you accept our ',
                                  style: mediumTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                    ),
                                    TextSpan(
                                      text: 'Term of Use',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.085,
                        ),
                        customTextButton(
                          text: 'Register',
                          textStyle: mediumTextStyle.copyWith(color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
                          gradientColor: blueLinear,
                          onPressed: () {
                            navigateTo(context, CompleteProfileScreen());
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Divider(
                                color: gray_3,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Or',
                                textAlign: TextAlign.center,
                                style: mediumTextStyle,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Divider(
                                color: gray_3,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customSocialMediaButton(icon: Paths.googleIcon, onTap: () {}),
                            const SizedBox(width: 30),
                            customSocialMediaButton(icon: Paths.facebookIcon, onTap: () {}),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: mediumTextStyle.copyWith(
                                color: blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {},
                              child: Text(
                                'Login',
                                style: mediumTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  foreground: Paint()
                                    ..shader = purpleLinear.createShader(
                                      const Rect.fromLTWH(0.0, 00.0, 200.0, 70.0),
                                    ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
