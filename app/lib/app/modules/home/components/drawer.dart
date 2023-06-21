import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/singleton/system.dart';
import 'package:mobile/app/routes/app_pages.dart';
import 'package:mobile/app/theme/theme.dart';

class HomeItemDto {
  String? title;
  String? svgSrc;
  Function? press;

  HomeItemDto({this.title, this.svgSrc, this.press});
}

class DJDrawer extends StatelessWidget {
  final List<HomeItemDto>? itens;
  const DJDrawer({super.key, this.itens});

  findItensDrawer() {
    return [
      HomeItemDto(
        title: "Dashboard",
        svgSrc: "assets/icons/menu_dashbord.svg",
        press: () => Get.toNamed(AppRoutes.home),
      ),
      /*
      HomeItemDto(
        title: "Instalações",
        svgSrc: "assets/icons/bar-chart.svg",
        press: () => Get.toNamed(Route.INSTALLATION),
      ),
      HomeItemDto(
        title: "Task",
        svgSrc: "assets/icons/menu_task.svg",
        press: () => Get.toNamed(Routes.TASK),
      ),
      HomeItemDto(
        title: "Store",
        svgSrc: "assets/icons/menu_store.svg",
        press: () => Get.toNamed(Routes.STORE),
      ),
      HomeItemDto(
        title: "Notification",
        svgSrc: "assets/icons/menu_notification.svg",
        press: () => Get.toNamed(Routes.NOTIFICATIONS),
      ),
      HomeItemDto(
        title: "Profile",
        svgSrc: "assets/icons/menu_profile.svg",
        press: () => Get.toNamed(Routes.PROFILE),
      ),
      HomeItemDto(
        title: "Settings",
        svgSrc: "assets/icons/menu_setting.svg",
        press: () => Get.toNamed(Routes.CONFIG),
      ),
      HomeItemDto(
        title: "Logout",
        svgSrc: "assets/icons/logout.svg",
        press: () => logout,
      ),*/
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: appThemeData().appBarTheme.backgroundColor,
              ),
              currentAccountPicture: const Icon(Icons.account_circle, size: 80),
              accountName: Text(
                System.instance().getUser().getName(),
                style: const TextStyle(fontSize: 17),
              ),
              accountEmail: Text(
                System.instance().getUser().getEmail(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Column(
              children: List.generate(
                itens!.length,
                (index) => DrawerButton(
                  onPressed: () => itens?[index].press,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
