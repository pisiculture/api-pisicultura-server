import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/models/notifications.model.dart';
import 'package:mobile/app/global/components/list.title.dart';
import 'package:mobile/app/global/components/scaffold.list.dart';
import 'package:mobile/app/global/components/text.dart';
import 'package:mobile/app/modules/home/notifications/notification.controller.dart';

class NotificationPage extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return DwScaffoldList(
      title: "Notificações",
      body: FutureBuilder<List<Notifications>>(
        future: controller.findByIdUser(),
        // ignore: missing_return
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final lista = snapshot.data;
            return ListView.builder(
              itemCount: lista!.length,
              itemBuilder: (context, index) {
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
          }
        },
      ),
    );
  }
}
