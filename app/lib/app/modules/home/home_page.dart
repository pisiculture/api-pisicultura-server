import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/components/card.dart';
import 'package:mobile/app/modules/home/components/drawer.dart';
import 'package:mobile/app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pisicultura'),
      ),
      drawer: DJDrawer(),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          const SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(.01),
            sliver: SliverToBoxAdapter(
              child: Flexible(
                child: Row(
                  children: <Widget>[
                    DwCard(
                      title: 'PH',
                      count: 6.4
                          .toString(), //controller.dashboard.ph.value.toString(),
                      color: Colors.red,
                    ),
                    DwCard(
                      title: 'Temperatura',
                      count: '${27.2} °C',
                      color: Colors.yellow,
                    ),
                    DwCard(
                      title: 'Oxigenação',
                      count: '${4.6} mg/l',
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* SliverPadding(
            padding: const EdgeInsets.only(top: 10.0, left: 5),
            sliver: SliverToBoxAdapter(
              child: ListTile(
                title: const Text(
                  'Tarefas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: DwIconButton(
                  icon: Icons.refresh,
                  sizeIcon: 25,
                  corIcon: Colors.orange,
                  onPressed: () => controller.taskRepository.find(),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(2),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: appThemeData().backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                height: Get.height * 0.6,
                child: DwListCardsTasks(repository: controller.taskRepository),
              ),
            ),
          )*/
        ],
      ),
    );
  }
}
