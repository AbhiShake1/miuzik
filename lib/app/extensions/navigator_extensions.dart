import 'package:flutter/material.dart';

extension NavigatorX on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  void pushNamedAndRemoveAll(String routeName) =>
      navigator.pushNamedAndRemoveUntil(routeName, (route) => false);

  void pushReplacementNamed(String routeName) =>
      navigator.pushReplacementNamed(routeName);

  void popAndPushNamed(String routeName) =>
      navigator.popAndPushNamed(routeName);

  void pushReplacement(Widget page) => navigator.pushReplacement(
        MaterialPageRoute<dynamic>(builder: (_) => page),
      );

  void pushNamed(String routeName) => navigator.pushNamed(routeName);

  void push(Widget page) => navigator.push(
        MaterialPageRoute<dynamic>(builder: (_) => page),
      );

  void pop() => navigator.pop(this);
}
