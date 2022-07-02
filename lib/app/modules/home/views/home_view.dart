import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miuzik/app/modules/home/controllers/home_controller.dart';
import 'package:miuzik/base_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Center(
          child: TextButton(
            onPressed: controller.signOut,
            child: const Text('Signout'),
          ),
        ),
      ),
    );
  }
}
