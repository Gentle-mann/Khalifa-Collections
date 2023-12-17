import 'package:flutter/material.dart';

class SizeSetup {
  static double? height;
  static double? width;
  static double? rSize;
  static Orientation? orientation;

  void setReferenceSizes(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    orientation = MediaQuery.of(context).orientation;
    rSize = orientation == Orientation.portrait
        ? width! * 0.0236
        : height! * 0.0236;
  }
}
