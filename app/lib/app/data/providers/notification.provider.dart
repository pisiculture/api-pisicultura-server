import 'package:mobile/app/data/models/notifications.model.dart';
import 'package:mobile/app/data/providers/connect.dart';

import '../base_url.dart';

class NotificationApiClient extends DwGetConnect {
  getUser(int iduser) async {
    try {
      final response = await get('$baseUrlApp/app/notification/$iduser');
      return response.statusCode == 202 ? response.body as List : null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  register(Notifications entity) async {
    try {
      final response =
          await post('$baseUrlApp/app/notification', entity.toJson());
      return response.statusCode == 201 ? response.body : null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> deletar(int id) async {
    try {
      final response = await delete('$baseUrlApp/app/notification/$id');
      return response.statusCode == 202;
    } catch (e) {
      return false;
    }
  }
}
