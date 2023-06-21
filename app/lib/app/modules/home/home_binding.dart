import 'package:get/get.dart';
import 'package:mobile/app/data/providers/dashboard.provider.dart';
import 'package:mobile/app/data/providers/task.provider.dart';
import 'package:mobile/app/data/repository/task.repository.dart';
import 'package:mobile/app/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DashboardRepository());

    Get.lazyPut(() => TaskRepository());
    Get.lazyPut(() => TaskApiClient());
  }
}
