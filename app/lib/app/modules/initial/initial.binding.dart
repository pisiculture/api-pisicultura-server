import 'package:get/get.dart';
import 'package:mobile/app/data/providers/user.provider.dart';
import 'package:mobile/app/data/repository/user.repository.dart';
import 'package:mobile/app/modules/initial/initial.controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialController());
    Get.lazyPut(() => UserApiClient());
    Get.lazyPut(() => UserRepository());
  }
}
