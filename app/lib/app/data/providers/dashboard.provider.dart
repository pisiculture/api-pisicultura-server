import 'package:mobile/app/data/models/dashboard_model.dart';
import 'package:mobile/app/data/repository/Dashboard_provider.dart';

class DashboardRepository {
  final client = DashboardClient();

  dashboard() async {
    const String id = '432423432423432432432432';

    final response = await client.dashboard(id);

    final dashbord = Dashbord.fromJson(response);
    print(dashbord.data);
  }
}
