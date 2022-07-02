import 'package:get/get.dart';
import 'package:miuzik/app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NavigationController extends GetxController {
  final _client = Supabase.instance.client;

  @override
  void onInit() {
    _client.auth.onAuthStateChange((event, session) {
      switch (event) {
        case AuthChangeEvent.signedIn:
          Get.offAllNamed(Routes.HOME);
          break;
        case AuthChangeEvent.signedOut:
          Get.offAllNamed(Routes.SIGN_IN);
          break;
        case AuthChangeEvent.passwordRecovery:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.tokenRefreshed:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.userUpdated:
          // TODO: Handle this case.
          break;
      }
    });
    super.onInit();
  }
}
