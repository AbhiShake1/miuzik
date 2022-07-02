import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miuzik/app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Supabase.instance.client.auth.currentUser != null) {
      return const RouteSettings(name: Routes.HOME);
    }
    return null;
  }
}
