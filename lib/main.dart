import 'package:device_preview/device_preview.dart';
import 'package:fitness_app/modules/onboarding/get_started_screen.dart';
import 'package:fitness_app/shared/components/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DeviceDimensions.setDeviceSize(context);
    return ScreenUtilInit(
      designSize: DeviceDimensions.designSize,
      builder: (_) {
        DeviceDimensions.setDeviceSize(context);
        return MaterialApp(
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          debugShowCheckedModeBanner: false,
          // Use this line to prevent extra rebuilds
          useInheritedMediaQuery: true,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Poppins',
          ),
          home: const GetStartedScreen(),
        );
      },
    );
  }
}
