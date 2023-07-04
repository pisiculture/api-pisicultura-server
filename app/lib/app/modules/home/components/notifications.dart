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
    return SingleChildScrollView(
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
                style: TextStyle(
                  fontSize: 18,
                ),
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
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (lista.isNotEmpty) {
                          return ListTile(
                            title: Text(lista[index].getTitle().toString()),
                            subtitle:
                                Text(lista[index].getDescription().toString()),
                            leading: Icon(
                              Icons.info_outline,
                              color: findColor(lista[index].getType()),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                widget.controller.notificationRepository
                                    .read(lista[index].getId());
                                build(context);
                              },
                              child: const Icon(Icons.thumb_up_off_alt_sharp),
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

  Color findColor(String type) {
    if (type == "INFO") {
      return Colors.blue;
    } else if (type == "WARNING") {
      return Colors.yellowAccent;
    } else if (type == "ERROR") {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
