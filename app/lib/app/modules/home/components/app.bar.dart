import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/components/icon.button.dart';
import 'package:mobile/app/modules/home/home.controller.dart';
import 'package:mobile/app/routes/app_pages.dart';
import 'package:mobile/app/theme/theme.dart';

// ignore: must_be_immutable
class DwAppBarHome extends StatelessWidget {
  HomeController? controller;

  DwAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size(1, 1),
        child: AppBar(
          backgroundColor: appThemeData().appBarTheme.backgroundColor,
          actions: <Widget>[
            Positioned(
              child: Obx(
                () => DwIconButton(
                  icon: controller!.notifications.value > 0
                      ? Icons.notifications_on_sharp
                      : Icons.notifications_none,
                  corIcon: controller!.notifications.value > 0
                      ? Colors.yellow
                      : Colors.white,
                  sizeIcon: controller!.notifications.value > 0 ? 26 : 24,
                  onPressed: () => Get.defaultDialog(
                    title: 'Alerta',
                    backgroundColor: appThemeData().dialogBackgroundColor,
                    buttonColor: appThemeData().disabledColor,
                    textConfirm: 'Visualizar',
                    textCancel: 'Cancelar',
                    middleText:
                        'Você tem novas mensagens na sua caixa de entrada!',
                    onConfirm: () {
                      Get.back();
                      Get.toNamed(AppRoutes.notification);
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
