import 'package:get/get.dart';
import 'package:mobile/app/modules/home/home.binding.dart';
import 'package:mobile/app/modules/home/home.page.dart';
import 'package:mobile/app/routes/app_pages.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
