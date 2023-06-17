import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text("teste"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.dashboard.dashboard(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // ,
    );
  }
}
