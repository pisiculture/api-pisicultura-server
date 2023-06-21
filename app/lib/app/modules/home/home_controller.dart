import 'package:get/get.dart';
import 'package:mobile/app/data/providers/dashboard.provider.dart';

class HomeController extends GetxController {
  final dashboard = Get.find<DashboardRepository>();
}
