import 'package:mobile/app/data/providers/connect.dart';

class DashboardClient extends DwGetConnect {
  dashboard(id) async {
    try {
      final response = await getD('http://localhost:8080/app/dashboard/$id');
      print(response.body);
      return response.statusCode == 202 ? response.body : null;
    } catch (e) {
      print(e);
    }
  }
}
