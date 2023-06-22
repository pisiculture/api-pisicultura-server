import 'package:mobile/app/data/models/notifications.model.dart';
import 'package:mobile/app/data/providers/notification.provider.dart';
import 'package:mobile/app/global/singleton/system.dart';

class NotificationRepository {
  final NotificationApiClient apiClient = NotificationApiClient();

  Future<bool> deletar(id) async {
    return await apiClient.deletar(id);
  }

  Future<List<Notifications>> getNotifications(int iduser) async {
    var res = await apiClient.getUser(iduser);
    // ignore: prefer_null_aware_operators
    return res != null
        ? res.map<Notifications>((e) => Notifications.fromJson(e)).toList()
        : null;
  }

  Future<Notifications> register(Notifications entity) async {
    //entity.iduser = System.getInstance().getUser().getId();

    return Notifications.fromJson(await apiClient.register(entity));
  }
}
