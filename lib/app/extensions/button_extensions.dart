import 'package:flutter/material.dart';

extension ButtonX on Widget {
  Widget onClick(void Function() onClick) => InkWell(
        onTap: onClick,
        child: this,
      );
}
