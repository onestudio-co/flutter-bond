import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeUtil {
  // get height tabBar (dp)
  static double getTab() {
    return ScreenUtil().statusBarHeight;
  }

  // get height bottomBar (dp)
  static double getTabBottom() {
    return ScreenUtil().bottomBarHeight;
  }

  // get % width device (dp)
  static double getScreenWidthFull(double percent) {
    return percent.sw;
  }

  // get % height device (dp)
  static double getScreenHeightFull(double percent) {
    return percent.sh;
  }

  // get % width in app (dp)
  static double getScreenWidth(double percent) {
    return percent * (1.sw - getTabBottom() - getTab());
  }

  // get % height in app (dp)
  static double getScreenHeight(double percent) {
    return percent * (1.sh - getTabBottom() - getTab());
  }

  // set width (dp)
  static double setWidth(double width) {
    return width.w;
  }

  // set height (dp)
  static double setHeight(double height) {
    return height.h;
  }

  // set font text (sp)
  static double setFontText(double font) {
    return font.sp;
  }

  static double setRadius(double radius) {
    return ScreenUtil().radius(radius);
  }

  static double setPadding(double padding) {
    return padding.sp;
  }
}
