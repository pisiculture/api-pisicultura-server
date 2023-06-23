import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/models/notifications.model.dart';
import 'package:mobile/app/global/components/list.title.dart';
import 'package:mobile/app/global/components/scaffold.list.dart';
import 'package:mobile/app/global/components/text.dart';
import 'package:mobile/app/modules/notifications/notification.controller.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DwScaffoldList(
      title: "Notificações",
      body: FutureBuilder<List<Notifications>>(
        future: controller.findByIdUser(),
        builder:
            (BuildContext cx, AsyncSnapshot<List<Notifications>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final lista = snapshot.data;
            return ListView.builder(
              itemCount: lista!.length,
              itemBuilder: (context, index) {
                // ignore: unnecessary_null_comparison
                if (lista != null) {
                  return DwListTile(
                    title: lista[index].getTitle().toString(),
                    leading: (index + 1).toString(),
                    subtitle: lista[index].getDescription().toString(),
                    onDelete: () => controller.deleteById(lista[index].getId()),
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
            return const DwText(lbl: "");
          }
        },
      ),
    );
  }
}
