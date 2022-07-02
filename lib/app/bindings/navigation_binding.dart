import 'package:get/get.dart';
import 'package:miuzik/app/controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController(), permanent: true);
  }
}
