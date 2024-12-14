import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/search_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SearchController());
  }
}
