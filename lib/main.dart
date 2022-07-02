import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:miuzik/app/bindings/navigation_binding.dart';
import 'package:miuzik/app/routes/app_pages.dart';
import 'package:miuzik/secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //init on storage also ensures widget flutter bindings are initialized
  final storageBoxes = ['GetStorage', 'settings', 'downloads', 'cache'];
  for (final box in storageBoxes) {
    await GetStorage.init(box);
  }

  await dotenv.load();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(
    ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GlassApp(
        theme: GlassThemeData(
          borderRadius: BorderRadius.circular(20),
          blur: 1.5,
          border: 0,
        ),
        home: GetMaterialApp(
          title: 'Miuzik',
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          initialBinding: NavigationBinding(),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            //for background image to work with base_view
            scaffoldBackgroundColor: Colors.transparent,
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
