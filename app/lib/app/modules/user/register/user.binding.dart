import 'package:get/get.dart';
import 'package:mobile/app/data/providers/user.provider.dart';
import 'package:mobile/app/data/repository/user.repository.dart';
import 'package:mobile/app/modules/user/register/user.controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => UserApiClient());
  }
}
