import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/constants/constants.dart';
import 'package:mobile/app/modules/home/components/cards.dart';
import 'package:mobile/app/modules/home/components/notifications.dart';
import 'package:mobile/app/modules/home/components/scaffold.dart';
import 'package:mobile/app/modules/home/components/users_by_device.dart';
import 'package:mobile/app/modules/home/components/viewers.dart';
import 'package:mobile/app/modules/home/home.controller.dart';
import 'package:mobile/app/global/constants/responsive.dart';
import 'package:mobile/app/modules/home/widgets/line_chart_card.dart';

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
                            LineChartCard(),
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
                                  const Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text("Implementar"),
                                    ),
                                  ),
                                if (!Responsive.isMobile(context))
                                  const SizedBox(
                                    width: appPadding,
                                  ),
                                const Expanded(
                                  flex: 3,
                                  child: Viewers(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: appPadding,
                            ),
                            if (Responsive.isMobile(context))
                              const SizedBox(height: appPadding),
                            if (Responsive.isMobile(context))
                              const Center(
                                child: Text("Implementar"),
                              ),
                            if (Responsive.isMobile(context))
                              const SizedBox(height: appPadding),
                            if (Responsive.isMobile(context))
                              const UsersByDevice(),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context))
                        const SizedBox(width: appPadding),
                      if (!Responsive.isMobile(context))
                        const Expanded(
                          flex: 2,
                          child: UsersByDevice(),
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
}
