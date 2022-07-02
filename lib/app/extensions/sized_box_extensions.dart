import 'package:flutter/material.dart';

extension SizedBoxX on num {
  SizedBox get widthBox => SizedBox(width: toDouble());
  SizedBox get heightBox => SizedBox(height: toDouble());
  SizedBox get squareBox => SizedBox(width: toDouble(), height: toDouble());
}
