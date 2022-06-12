import 'package:device_preview/device_preview.dart';
import 'package:fitness_app/modules/onboarding/get_started_screen.dart';
import 'package:fitness_app/shared/components/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
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
    return ScreenUtilInit(
      designSize: DeviceDimensions.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          debugShowCheckedModeBanner: false,
          // Use the line below to prevent extra rebuilds
          useInheritedMediaQuery: true,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Poppins',
          ),
          home: child,
        );
      },
      child: const GetStartedScreen(),
    );
  }
}
