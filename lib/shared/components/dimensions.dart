import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceDimensions {
  static const Size designSize = Size(375, 812);

  static setDeviceSize(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
  }

  static setHeight(num height) {
    return ScreenUtil().setHeight(height);
  }

  static setWidth(num width) {
    return ScreenUtil().setWidth(width);
  }

  static setFontSize(num fontSize) {
    return ScreenUtil().setSp(fontSize);
  }

  static setRadius(num radius) {
    return ScreenUtil().radius(radius);
  }

  static getRequiredHeight(double height) {
    double percent = ((height * 100) / designSize.height).roundToDouble();
    return ((percent / 100) * designSize.height).round();
  }

  static getRequiredWidth(double width) {
    double percent = ((width * 100) / designSize.width).roundToDouble();
    return ((percent / 100) * designSize.width).round();
  }
}
