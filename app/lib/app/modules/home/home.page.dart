import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/constants/constants.dart';
import 'package:mobile/app/modules/home/components/cards.dart';
import 'package:mobile/app/modules/home/components/notifications.dart';
import 'package:mobile/app/modules/home/components/scaffold.dart';
import 'package:mobile/app/modules/home/home.controller.dart';
import 'package:mobile/app/global/constants/responsive.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  HomePage({super.key}) {
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return DxScaffold(
      scaffoldKey: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            AnalyticCards(controller: controller),
                            const SizedBox(height: appPadding),
                            if (Responsive.isMobile(context))
                              const SizedBox(height: appPadding),
                            if (Responsive.isMobile(context))
                              NotificationInfo(
                                controller: controller,
                              ),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context))
                        const SizedBox(width: appPadding),
                      if (!Responsive.isMobile(context))
                        Expanded(
                          flex: 2,
                          child: NotificationInfo(
                            controller: controller,
                          ),
                        ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            const SizedBox(height: appPadding),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (!Responsive.isMobile(context))
                                  Expanded(
                                    flex: 2,
                                    child: _commands(),
                                  ),
                              ],
                            ),
                            const SizedBox(height: appPadding),
                            if (Responsive.isMobile(context))
                              const SizedBox(height: appPadding),
                            if (Responsive.isMobile(context)) _commands(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _commands() {
    return Center(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Controles",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Obx(
              () => Column(
                children: [
                  Row(
                    children: [
                      Switch(
                        value: controller.waterPump.value,
                        onChanged: (value) {
                          controller.waterPump.value = value;
                          controller.updateControles();
                        },
                      ),
                      const Text("Bomba"),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: controller.waterLock.value,
                        onChanged: (value) {
                          controller.waterLock.value = value;
                          controller.updateControles();
                        },
                      ),
                      const Text("Trava dispersor")
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: controller.lighting.value,
                        onChanged: (value) {
                          controller.lighting.value = value;
                          controller.updateControles();
                        },
                      ),
                      const Text("Luminária")
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
