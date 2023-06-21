import 'package:get/get.dart';
import 'package:mobile/app/data/repository/user.repository.dart';
import 'package:mobile/app/global/singleton/system.dart';
import 'package:mobile/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialController extends GetxController {
  UserRepository? userRepository = Get.find<UserRepository>();
  String? username;
  String? password;

  bool? ehPrimeiroLogin;

  auth() async {
    ehPrimeiroLogin = await _findDataUserMemory();

    if (ehPrimeiroLogin!) {
      System.getInstance()
          .setUser(await userRepository?.auth(username!, password!, true));
      if (System.getInstance().getUser() != null) {
        Get.offAndToNamed(AppRoutes.home);
      }
    }
  }

  Future<bool> _findDataUserMemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username') ?? '';
    password = prefs.getString('password') ?? '';
    return (username != '') && (password != '');
  }
}
