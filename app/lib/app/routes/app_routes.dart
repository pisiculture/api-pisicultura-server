import 'package:get/get.dart';
import 'package:mobile/app/modules/home/home_binding.dart';
import 'package:mobile/app/modules/home/home_page.dart';
import 'package:mobile/app/routes/app_pages.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
