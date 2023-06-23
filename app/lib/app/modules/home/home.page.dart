import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/components/card.dart';
import 'package:mobile/app/modules/home/components/drawer.dart';
import 'package:mobile/app/modules/home/home.controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

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
        ],
      ),
    );
  }
}
