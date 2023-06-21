import 'package:mobile/app/data/models/task.model.dart';
import 'package:mobile/app/data/providers/get_connect.dart';

class TaskApiClient extends DwGetConnect {
  find(int iduser) async {
    try {
      final response = await get('$baseUrl/app/task/$iduser');
      return response.statusCode == 201 ? response.body as List : null;
    } catch (e) {
      return null;
    }
  }
}
