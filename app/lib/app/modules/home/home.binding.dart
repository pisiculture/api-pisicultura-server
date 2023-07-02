import 'package:get/get.dart';
import 'package:mobile/app/data/providers/dashboard.provider.dart';
import 'package:mobile/app/data/repository/permission.repository.dart';
import 'package:mobile/app/modules/home/home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DashboardRepository());
    Get.lazyPut(() => PermissionRepository());
  }
}
