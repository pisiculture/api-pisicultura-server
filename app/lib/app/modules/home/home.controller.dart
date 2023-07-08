import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/app/data/models/dashboard.model.dart';
import 'package:mobile/app/data/models/permission.model.dart';
import 'package:mobile/app/data/providers/dashboard.provider.dart';
import 'package:mobile/app/data/repository/notification.repository.dart';
import 'package:mobile/app/data/repository/permission.repository.dart';
import 'package:mobile/app/global/singleton/system.dart';
import 'package:web_socket_channel/io.dart';

class HomeController extends GetxController {
  Dashbord? dashboard;
  final dashboardRepository = Get.find<DashboardRepository>();
  final permissionsRepository = Get.find<PermissionRepository>();
  final notificationRepository = Get.find<NotificationRepository>();

  final channel = IOWebSocketChannel.connect('ws://192.168.0.121:3002');

  RxString ph = RxString("0");
  RxString temperature = RxString("0");

  findPermission() async {
    List<Permission> per = await permissionsRepository
        .getPermission(System.getInstance().getUser().getId());
    if (per.isNotEmpty) {
      channel.sink.add(
          '{ "event": "REGISTER", "key": "${per[0].getInstallation().getKey()}", "connection": "CLIENT", "service": "DASHBOARD" }');
    }
  }

  HomeController() {
    findPermission();
    channel.stream.listen((message) {
      Map<String, dynamic> data = jsonDecode(message);
      ph.value = data['ph'].toString();
      temperature.value = data['temperature'].toString();

      //print(ph);
    });
  }
}
