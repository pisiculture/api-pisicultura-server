import 'package:get/get.dart';
import 'package:mobile/app/data/models/notifications.model.dart';
import 'package:mobile/app/data/providers/notification.provider.dart';
import 'package:mobile/app/global/singleton/system.dart';

class NotificationRepository {
  final NotificationApiClient apiClient = NotificationApiClient();

  Future<bool> deleteById(String id) async {
    return await apiClient.deletar(id);
  }

  Future<List<Notifications>> find() async {
    List<Notifications>? notifications = <Notifications>[];
    List<dynamic> req =
        await apiClient.getByIdUser(System.getInstance().getUser().getId());
    if (req.isNotEmpty) {
      for (var v in req) {
        if (v is Map<String, dynamic>) {
          notifications.add(Notifications.fromJson(v));
        }
      }
    }
    notifications.clear();
    return notifications;
  }
}
