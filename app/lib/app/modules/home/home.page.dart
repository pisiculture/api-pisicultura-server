import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/components/cards.dart';
import 'package:mobile/app/modules/home/components/discussions.dart';
import 'package:mobile/app/modules/home/components/drawer.dart';
import 'package:mobile/app/modules/home/components/top_referals.dart';
import 'package:mobile/app/modules/home/components/users_by_device.dart';
import 'package:mobile/app/modules/home/components/viewers.dart';
import 'package:mobile/app/modules/home/home.controller.dart';
import 'package:mobile/app/global/constants/responsive.dart';
import 'package:mobile/app/modules/home/widgets/line_chart_card.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  SizedBox _height(BuildContext context) =>
      SizedBox(height: Responsive.isDesktop(context) ? 30 : 20);
  HomePage({super.key}) {
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    const appPadding = 16.0;
    return Scaffold(
      key: _scaffoldKey,
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(width: 250, child: DDrawer(scaffoldKey: _scaffoldKey))
          : DDrawer(scaffoldKey: _scaffoldKey),
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: 300,
              child: SizedBox(
                  width: 250, child: DDrawer(scaffoldKey: _scaffoldKey)))
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              SizedBox(
                width: 300,
                height: MediaQuery.of(context).size.height,
                child: DDrawer(scaffoldKey: _scaffoldKey),
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
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (!Responsive.isDesktop(context))
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: InkWell(
                                    onTap: () =>
                                        _scaffoldKey.currentState!.openDrawer(),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SafeArea(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            children: [
                                              const AnalyticCards(),
                                              const SizedBox(
                                                  height: appPadding),
                                              LineChartCard(),
                                              if (Responsive.isMobile(context))
                                                const SizedBox(
                                                    height: appPadding),
                                              if (Responsive.isMobile(context))
                                                const Discussions(),
                                            ],
                                          ),
                                        ),
                                        if (!Responsive.isMobile(context))
                                          const SizedBox(width: appPadding),
                                        if (!Responsive.isMobile(context))
                                          const Expanded(
                                              flex: 2, child: Discussions()),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                  height: appPadding),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (!Responsive.isMobile(
                                                      context))
                                                    const Expanded(
                                                      flex: 2,
                                                      child: TopReferals(),
                                                    ),
                                                  if (!Responsive.isMobile(
                                                      context))
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
                                                const SizedBox(
                                                    height: appPadding),
                                              if (Responsive.isMobile(context))
                                                const TopReferals(),
                                              if (Responsive.isMobile(context))
                                                const SizedBox(
                                                    height: appPadding),
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
                        )
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
