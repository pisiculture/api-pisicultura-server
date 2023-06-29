import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/components/drawer.dart';
import 'package:mobile/app/modules/home/home.controller.dart';
import 'package:mobile/app/modules/home/widgets/activity_details_card.dart';
import 'package:mobile/app/modules/home/widgets/line_chart_card.dart';
import 'package:mobile/responsive.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  SizedBox _height(BuildContext context) => SizedBox(
        height: Responsive.isDesktop(context) ? 30 : 20,
      );
  HomePage({super.key}) {
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(width: 250, child: DDrawer(scaffoldKey: _scaffoldKey))
          : null,
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Container())
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 3,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: DDrawer(scaffoldKey: _scaffoldKey)),
              ),
            Expanded(
              flex: 8,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isMobile(context) ? 15 : 18),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Responsive.isMobile(context) ? 5 : 18,
                        ),
                        const ActivityDetailsCard(),
                        _height(context),
                        LineChartCard(),
                        _height(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
