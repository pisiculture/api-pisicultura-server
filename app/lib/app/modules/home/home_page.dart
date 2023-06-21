import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/repository/task.repository.dart';
import 'package:mobile/app/global/components/icon.button.dart';
import 'package:mobile/app/modules/home/components/cards.task.dart';
import 'package:mobile/app/modules/home/components/drawer.dart';
import 'package:mobile/app/modules/home/home_controller.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class HomePage extends GetView<HomeController> {
  final taskRepository = Get.find<TaskRepository>();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final channel = IOWebSocketChannel.connect('ws://localhost:3000');

    channel.stream.listen((message) {
      channel.sink.close(status.goingAway);
    });

    channel.sink
        .add('{ "event": "REGISTER", "key": "rewrw", "connection": "CLIENTE"}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pisicultura'),
      ),
      drawer: const DJDrawer(),
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
          SliverPadding(
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
          )
        ],
      ),
    );
  }
}
