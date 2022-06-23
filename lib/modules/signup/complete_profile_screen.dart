import 'package:fitness_app/modules/signup/goal_screen.dart';
import 'package:fitness_app/shared/components/components.dart';
import 'package:fitness_app/shared/components/constants.dart';
import 'package:fitness_app/shared/components/paths.dart';
import 'package:fitness_app/shared/styles/colors.dart';
import 'package:fitness_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({Key? key}) : super(key: key);

  final GlobalKey completeProfileFormKey = GlobalKey<FormState>();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                Paths.completeProfileImage,
                height: 375,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Column(
                  children: [
                    Text(
                      'Let’s complete your profile',
                      textAlign: TextAlign.center,
                      style: h4TextStyle.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'It will help us to know more about you!',
                      textAlign: TextAlign.center,
                      style: smallTextStyle.copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: completeProfileFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DropdownButtonFormField(
                            icon: Image.asset(
                              Paths.arrowDown,
                              color: gray_2,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: borderColor,
                              prefixIcon: Image.asset(
                                Paths.genderIcon,
                              ),
                              hintText: 'Choose Gender',
                              hintStyle: smallTextStyle.copyWith(
                                fontSize: 12,
                                color: gray_2,
                                fontWeight: FontWeight.w400,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: ' Male',
                                child: Text(
                                  'Male',
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Female',
                                child: Text(
                                  'Female',
                                ),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                          customTextFormField(
                            controller: dateOfBirthController,
                            readOnly: true,
                            type: TextInputType.text,
                            onTap: () async {
                              DateTime date = DateTime(2022, 12, 20);
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1975),
                                lastDate: DateTime(2100),
                              );
                              dateOfBirthController.text = newDate!.toString().split(' ')[0];
                            },
                            validate: (String? value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return 'please enter your date of birth';
                                }
                              }
                              return null;
                            },
                            placeHolder: 'Date of Birth',
                            prefixIcon: Paths.calendarIcon,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: customTextFormField(
                                  controller: weightController,
                                  verticalPadding: 0,
                                  type: TextInputType.number,
                                  validate: (String? value) {
                                    if (value != null) {
                                      if (value.isEmpty) {
                                        return 'please enter your weight';
                                      }
                                    }
                                    return null;
                                  },
                                  placeHolder: 'Your Weight',
                                  prefixIcon: Paths.weightIcon,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                    gradient: purpleLinear,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'KG',
                                      style: smallTextStyle.copyWith(fontSize: 12, color: whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: customTextFormField(
                                  controller: heightController,
                                  type: TextInputType.number,
                                  validate: (String? value) {
                                    if (value != null) {
                                      if (value.isEmpty) {
                                        return 'please enter your height';
                                      }
                                    }
                                    return null;
                                  },
                                  placeHolder: 'Your Height',
                                  prefixIcon: Paths.heightIcon,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                    gradient: purpleLinear,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'CM',
                                      style: smallTextStyle.copyWith(fontSize: 12, color: whiteColor),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          customTextButton(
                            text: 'Next',
                            textStyle: mediumTextStyle.copyWith(color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
                            gradientColor: blueLinear,
                            onPressed: () {
                              navigateTo(context, GoalScreen());
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
