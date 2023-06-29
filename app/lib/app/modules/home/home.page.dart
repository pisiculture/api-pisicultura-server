import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/components/drawer.dart';
import 'package:mobile/app/modules/home/home.controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key}) {
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pisicultura'),
      ),
      drawer: DJDrawer(),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
