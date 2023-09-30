import 'package:mobile/app/data/models/intallation.configuration.model.dart';
import 'package:mobile/app/data/providers/installation.configuration.provider.dart';
import 'package:mobile/app/global/singleton/system.dart';

class InstallationConfigurationRepository {
  final InstallationConfigurationApiClient apiClient =
      InstallationConfigurationApiClient();

  Future<InstallationConfiguration> find() async {
    InstallationConfiguration response = InstallationConfiguration();
    var req = await apiClient
        .getConfigs(System.getInstance().getInstallation().getKey());
    if (req != null && req.isNotEmpty) {
      if (req is Map<String, dynamic>) {
        response = InstallationConfiguration.fromJson(req);
      }
    }
    return response;
  }

  Future<void> update(InstallationConfiguration vo) async {
    await apiClient.update(System.getInstance().getInstallation().getKey(), vo);
  }
}
