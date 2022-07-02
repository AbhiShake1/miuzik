import 'package:flutter/material.dart';

extension PaddingX on Widget {
  ///not needed coz we are using getx which has this extension
  // Widget paddingAll(double value) => Padding(
  //       padding: EdgeInsets.all(value),
  //       child: this,
  //     );

  Widget paddingX(double value) => Padding(
        padding: EdgeInsets.symmetric(horizontal: value),
        child: this,
      );

  Widget paddingY(double value) => Padding(
        padding: EdgeInsets.symmetric(vertical: value),
        child: this,
      );

  // Widget paddingSymmetric({required double x, required double y}) => Padding(
  //       padding: EdgeInsets.symmetric(vertical: y, horizontal: x),
  //       child: this,
  //     );

  Widget paddingOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          right: right,
          top: top,
          bottom: bottom,
        ),
        child: this,
      );
}
