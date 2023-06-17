import 'package:mobile/app/data/provider/get_connect.dart';

class DashboardClient extends DwGetConnect {
  dashboard(id) async {
    try {
      final response = await find('http://localhost:8080/app/dashboard/$id');
      print(response.body);
      return response.statusCode == 202 ? response.body : null;
    } catch (e) {
      print(e);
    }
  }
}
