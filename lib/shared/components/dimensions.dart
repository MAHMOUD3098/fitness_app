import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceDimensions {
  static const Size designSize = Size(375, 812);

  static setDeviceSize(BuildContext context) {
    Size deviceSize = Size(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    ScreenUtil.init(context, designSize: designSize, deviceSize: deviceSize);
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
}
