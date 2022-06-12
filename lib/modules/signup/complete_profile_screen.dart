import 'package:fitness_app/shared/components/dimensions.dart';
import 'package:fitness_app/shared/components/paths.dart';
import 'package:fitness_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: DeviceDimensions.setHeight(40), horizontal: DeviceDimensions.setWidth(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Paths.completeProfileImage),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'data',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'data',
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: borderColor,
                        borderRadius: BorderRadius.circular(DeviceDimensions.setRadius(14)),
                      ),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        // isExpanded: true,

                        items: const [
                          DropdownMenuItem(
                            value: ' items',
                            child: Text('items'),
                          ),
                          // DropdownMenuItem(
                          //   value: 'ss',
                          //   child: Text('ss'),
                          // ),
                          // DropdownMenuItem(
                          //   value: 'ss',
                          //   child: Text('ss'),
                          // ),
                        ],
                        onChanged: (value) {},
                        icon: const Icon(
                          Icons.person,
                        ),
                        // dropdownColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
