import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/app/data/models/dashboard.model.dart';
import 'package:mobile/app/data/models/intallation.configuration.model.dart';
import 'package:mobile/app/data/models/permission.model.dart';
import 'package:mobile/app/data/repository/Installation.configuration.repository.dart';
import 'package:mobile/app/data/repository/notification.repository.dart';
import 'package:mobile/app/data/repository/permission.repository.dart';
import 'package:mobile/app/global/singleton/system.dart';
import 'package:web_socket_channel/io.dart';

class HomeController extends GetxController {
  Dashbord? dashboard;
  final permissionsRepository = Get.find<PermissionRepository>();
  final notificationRepository = Get.find<NotificationRepository>();
  final installationConfiguratioRepository =
      Get.find<InstallationConfigurationRepository>();

  final channel = IOWebSocketChannel.connect('ws://192.168.0.121:3002');

  RxString ph = RxString("0");
  RxString temperature = RxString("0");
  RxString pendency = RxString("0");
  RxString alert = RxString("0");
  RxBool waterPump = RxBool(false);
  RxBool waterLock = RxBool(false);
  RxBool lighting = RxBool(false);

  findPermission() async {
    List<Permission> per = await permissionsRepository
        .getPermission(System.getInstance().getUser().getId());
    if (per.isNotEmpty) {
      System.getInstance().setInstallation(per[0].getInstallation());
      startControles();
      channel.sink.add(
          '{ "event": "REGISTER", "key": "${per[0].getInstallation().getKey()}", "connection": "CLIENT", "service": "DASHBOARD" }');
    }
  }

  updateControles() {
    InstallationConfiguration vo = InstallationConfiguration();
    vo.lighting = lighting.value;
    vo.waterPump = waterPump.value;
    vo.waterLock = waterLock.value;
    installationConfiguratioRepository.update(vo);
  }

  startControles() async {
    InstallationConfiguration vo =
        await installationConfiguratioRepository.find();
    lighting.value = vo.lighting!;
    waterPump.value = vo.waterPump!;
    waterLock.value = vo.waterLock!;
  }

  HomeController() {
    findPermission();
    channel.stream.listen((message) {
      Map<String, dynamic> data = jsonDecode(message);
      if (data['ph'] != "0") {
        ph.value = data['ph'].toString();
      }
      if (data['temperature'] != "0") {
        temperature.value = data['temperature'].toString();
      }
      if (data['pendency'] != "0") {
        pendency.value = data['pendency'].toString();
      }
      if (data['alert'] != "0") {
        alert.value = data['alert'].toString();
      }
    });
  }
}
