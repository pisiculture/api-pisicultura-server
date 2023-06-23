import 'package:get/get.dart';
import 'package:mobile/app/modules/home/home.binding.dart';
import 'package:mobile/app/modules/home/home.page.dart';
import 'package:mobile/app/modules/initial/initial.binding.dart';
import 'package:mobile/app/modules/initial/initial.page.dart';
import 'package:mobile/app/modules/user/auth/auth.binding.dart';
import 'package:mobile/app/modules/user/auth/auth.page.dart';
import 'package:mobile/app/routes/app_pages.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => InitialPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
  ];
}
