import 'package:fitness_app/modules/login/welcome_screen.dart';
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

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey loginFormKey = GlobalKey<FormState>();

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
                  key: loginFormKey,
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
                          'Welcome Back',
                          textAlign: TextAlign.center,
                          style: h4TextStyle.copyWith(fontWeight: FontWeight.w700),
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
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: InkWell(
                            enableFeedback: false,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: Text(
                              'Forgot your password?',
                              style: mediumTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 285,
                        ),
                        customTextButton(
                          text: 'Login',
                          textStyle: mediumTextStyle.copyWith(color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
                          gradientColor: blueLinear,
                          onPressed: () {
                            navigateAndFinish(
                              context,
                              WelcomeScreen(),
                            );
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
                              'Don\'t have an account yet?',
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
                                'Register',
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
