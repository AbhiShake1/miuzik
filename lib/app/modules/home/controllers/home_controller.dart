import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final _client = Supabase.instance.client;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signOut() => _client.auth.signOut();
}
