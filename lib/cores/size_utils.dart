import 'package:flutter/material.dart';
import 'package:get/get.dart';

Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;
const num DESIGN_WIDTH = 390;
const num DESIGN_HEIGHT = 844;
const num DESIGN_STATUS_BAR = 43;

///This method is used to get device viewport width.
get width {
  return size.width;
}

///This method is used to get device viewport height.
get height {
  num statusBar =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).viewPadding.top;
  num screenHeight = size.height - statusBar;
  return screenHeight;
}

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) {
  return (px * width) / DESIGN_WIDTH;
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  return (px * height) / (DESIGN_HEIGHT - DESIGN_STATUS_BAR);
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  return getSize(px);
}

///This method is used to set custom padding


double getPaddingSize(String symbol) {
  double finalValue = 0.0;
  Map symbols = {
    "xxxxs": 0.0,
    "xxxs": 0.0,
    "xxs": 0.0,
    "xs": 0.0,
    "s": 0.0,
    "m": 0.0,
    "l": 0.0,
    "xl": 0.0,
    "xxl": 0.0,
    "xxxl": 0.0,
    "xxxxl": 0.0,
  };
  if (MediaQuery.of(Get.context!).size.width <= 320 &&
      MediaQuery.of(Get.context!).size.height <= 667) {
    symbols["xxxxs"] = 1.0;
    symbols["xxxs"] = 1.0;
    symbols["xxs"] = 2.0;
    symbols["xs"] = 4.0;
    symbols["s"] = 8.0;
    symbols["m"] = 12.0;
    symbols["l"] = 16.0;
    symbols["xl"] = 24.0;
    symbols["xxl"] = 32.0;
    symbols["xxxl"] = 48.0;
    symbols["xxxxl"] = 96.0;
  } else if (MediaQuery.of(Get.context!).size.width >= 320 &&
      MediaQuery.of(Get.context!).size.width <= 375 &&
      MediaQuery.of(Get.context!).size.height >= 667 &&
      MediaQuery.of(Get.context!).size.height <= 812) {
    symbols["xxxxs"] = 1.0;
    symbols["xxxs"] = 2.0;
    symbols["xxs"] = 4.0;
    symbols["xs"] = 8.0;
    symbols["s"] = 12.0;
    symbols["m"] = 16.0;
    symbols["l"] = 24.0;
    symbols["xl"] = 32.0;
    symbols["xxl"] = 48.0;
    symbols["xxxl"] = 64.0;
    symbols["xxxxl"] = 128.0;
  } else if (MediaQuery.of(Get.context!).size.width >= 375 &&
      MediaQuery.of(Get.context!).size.width <= 428 &&
      MediaQuery.of(Get.context!).size.height >= 812 &&
      MediaQuery.of(Get.context!).size.height <= 926) {
    symbols["xxxxs"] = 1.0;
    symbols["xxxs"] = 3.0;
    symbols["xxs"] = 6.0;
    symbols["xs"] = 12.0;
    symbols["s"] = 16.0;
    symbols["m"] = 24.0;
    symbols["l"] = 32.0;
    symbols["xl"] = 40.0;
    symbols["xxl"] = 56.0;
    symbols["xxxl"] = 80.0;
    symbols["xxxxl"] = 160.0;
  }

  symbols.forEach((key, value) {
    if (key == symbol) {
      finalValue = value;
    }
  });

  return finalValue;
}

///This method is used to set padding responsively
// EdgeInsetsGeometry getPadding({
//   double? all,
//   double? left,
//   double? top,
//   double? right,
//   double? bottom,
// }) {
//   return getMarginOrPadding(
//     all: all,
//     left: left,
//     top: top,
//     right: right,
//     bottom: bottom,
//   );
// }

///This method is used to set margin responsively
// EdgeInsetsGeometry getMargin({
//   double? all,
//   double? left,
//   double? top,
//   double? right,
//   double? bottom,
// }) {
//   return getMarginOrPadding(
//     all: all,
//     left: left,
//     top: top,
//     right: right,
//     bottom: bottom,
//   );
// }

///This method is used to set margin responsively
// EdgeInsetsGeometry getMarginOrPadding({
//   double? all,
//   double? left,
//   double? top,
//   double? right,
//   double? bottom,
// }) {
//   if (all != null) {
//     left = all;
//     top = all;
//     right = all;
//     bottom = all;
//   }
//   return EdgeInsets.only(
//     left: getHorizontalSize(
//       left ?? 0,
//     ),
//     top: getVerticalSize(
//       top ?? 0,
//     ),
//     right: getHorizontalSize(
//       right ?? 0,
//     ),
//     bottom: getVerticalSize(
//       bottom ?? 0,
//     ),
//   );
// }
