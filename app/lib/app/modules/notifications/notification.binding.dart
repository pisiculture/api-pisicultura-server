import 'package:get/get.dart';
import 'package:mobile/app/data/providers/notification.provider.dart';
import 'package:mobile/app/data/repository/notification.repository.dart';
import 'package:mobile/app/modules/notifications/notification.controller.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
    Get.lazyPut(() => NotificationRepository());
    Get.lazyPut(() => NotificationApiClient());
  }
}
