import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

enum ScreenSize { mobile, tablet, desktop }

class ResponsiveUtils {
  static ScreenSize getScreenSize() {
    double width = Get.width;
    if (width >= 1024) {
      return ScreenSize.desktop;
    } else if (width >= 600) {
      return ScreenSize.tablet;
    } else {
      return ScreenSize.mobile;
    }
  }

  static bool isMobile() => getScreenSize() == ScreenSize.mobile;

  static bool isTablet() => getScreenSize() == ScreenSize.tablet;

  static bool isDesktop() => getScreenSize() == ScreenSize.desktop;
}
