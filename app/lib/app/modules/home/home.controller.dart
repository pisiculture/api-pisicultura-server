import 'package:get/get.dart';
import 'package:mobile/app/data/models/dashboard_model.dart';
import 'package:mobile/app/data/models/permission.model.dart';
import 'package:mobile/app/data/providers/dashboard.provider.dart';
import 'package:mobile/app/data/repository/notification.repository.dart';
import 'package:mobile/app/data/repository/permission.repository.dart';
import 'package:mobile/app/global/singleton/system.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class HomeController extends GetxController {
  Dashbord? dashboard;
  final dashboardRepository = Get.find<DashboardRepository>();
  final permissionsRepository = Get.find<PermissionRepository>();
  final notificationRepository = Get.find<NotificationRepository>();

  final channel = IOWebSocketChannel.connect('ws://192.168.0.121:3002');

  findPermission() async {
    List<Permission> per = await permissionsRepository
        .getPermission(System.getInstance().getUser().getId());
    if (per.isNotEmpty) {
      channel.sink.add(
          '{ "event": "REGISTER", "key": "${per[0].getInstallation()}", "connection": "CLIENTE", "service": "NOTIFICATION" }');
    }
  }

  HomeController() {
    findPermission();
    channel.stream.listen((message) {
      channel.sink.close(status.goingAway);
    });
  }
}
