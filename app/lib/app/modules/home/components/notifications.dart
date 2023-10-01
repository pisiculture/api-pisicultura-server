import 'package:flutter/material.dart';
import 'package:mobile/app/data/models/notifications.model.dart';
import 'package:mobile/app/global/components/text.dart';
import 'package:mobile/app/modules/home/home.controller.dart';

// ignore: must_be_immutable
class NotificationInfo extends StatefulWidget {
  HomeController controller;

  NotificationInfo({super.key, required this.controller});

  @override
  State<NotificationInfo> createState() => _NotificationInfoState();
}

class _NotificationInfoState extends State<NotificationInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeData().cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Notificações",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<Notifications>>(
              future: widget.controller.notificationRepository.find(),
              builder: (BuildContext cx,
                  AsyncSnapshot<List<Notifications>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  final lista = snapshot.data;
                  if (lista!.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        if (lista.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Container(
                              color: Colors.black12,
                              child: ListTile(
                                title: Text(lista[index].getTitle().toString()),
                                subtitle: Text(
                                    lista[index].getDescription().toString()),
                                leading: findIcon(lista[index].getType()),
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: DwText(
                              lbl: 'Não encontramos registros',
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    return const DwText(lbl: "Não encontramos registros");
                  }
                } else {
                  return const DwText(lbl: "Não encontramos registros");
                }
              },
            )
          ],
        ),
      ),
    );
  }

  findFieldCreateAtFormated() {
    return "";
  }

  Icon findIcon(String type) {
    if (type == "INFO") {
      return Icon(Icons.info_outlined, color: findColor(type));
    } else if (type == "WARNING") {
      return Icon(Icons.wechat, color: findColor(type));
    } else if (type == "ERROR") {
      return Icon(Icons.block, color: findColor(type));
    } else {
      return const Icon(Icons.abc_outlined);
    }
  }

  Color findColor(String type) {
    if (type == "INFO") {
      return Colors.blue;
    } else if (type == "WARNING") {
      return const Color.fromARGB(255, 233, 144, 28);
    } else if (type == "ERROR") {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
