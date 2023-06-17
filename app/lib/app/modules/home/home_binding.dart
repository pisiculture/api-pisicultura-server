import 'package:get/get.dart';
import 'package:mobile/app/data/provider/Dashboard_provider.dart';
import 'package:mobile/app/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DashboardRepository());
  }
}
