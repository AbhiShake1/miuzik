import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:miuzik/app/routes/app_pages.dart';

void main() async {
  //init on storage also ensures widget flutter bindings are initialized
  final storageBoxes = ['GetStorage', 'settings', 'downloads', 'cache'];
  for (final box in storageBoxes) {
    await GetStorage.init(box);
  }

  runApp(
    GetMaterialApp(
      title: 'Miuzik',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
