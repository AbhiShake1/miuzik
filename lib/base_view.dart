import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/blurred_bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
