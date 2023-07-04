import 'package:flutter/material.dart';
import 'package:mobile/app/data/models/notifications.model.dart';
import 'package:mobile/app/global/components/list.title.dart';
import 'package:mobile/app/global/components/text.dart';
import 'package:mobile/app/modules/home/home.controller.dart';

// ignore: must_be_immutable
class NotificationInfo extends StatelessWidget {
  HomeController controller;

  NotificationInfo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List<Notifications>>(
        future: controller.notificationRepository.find(),
        builder:
            (BuildContext cx, AsyncSnapshot<List<Notifications>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final lista = snapshot.data;
            if (lista!.isNotEmpty) {
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  if (lista.isNotEmpty) {
                    return DwListTile(
                      title: lista[index].getTitle().toString(),
                      leading: (index + 1).toString(),
                      subtitle: lista[index].getDescription().toString(),
                      onDelete: () => controller.notificationRepository
                          .deleteById(lista[index].getId()),
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
      ),
    );
  }

  findFieldCreateAtFormated() {
    return "";
  }

  findSvgType(String type) {
    if (type == "INFO") {
      return "";
    } else if (type == "WARNING") {
      return "";
    } else if (type == "ERROR") {
      return "";
    } else {
      return "";
    }
  }
}
