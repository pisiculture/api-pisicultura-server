import 'package:flutter/widgets.dart';
import 'package:mobile/app/data/models/notifications.model.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/repository/notification.repository.dart';
import 'package:mobile/app/global/singleton/system.dart';

class NotificationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  NotificationRepository repository = Get.find<NotificationRepository>();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  validInfo() async {
    if (formKey.currentState!.validate()) {
      Notifications notification = Notifications();
      //Notifications(title: title.text, description: description.text);
      // ignore: unnecessary_null_comparison
      if (await repository.register(notification) != null) {
        Get.snackbar("Ok", 'Cadastrado com sucesso!!');
      }
    }
  }

  Future<bool> deleteById(int id) async {
    return await repository.deletar(id);
  }

  Future<List<Notifications>> findByIdUser() async {
    return await repository
        .getNotifications(System.getInstance().getUser().getId());
  }
}
