import 'package:mobile/app/data/models/permission.model.dart';
import 'package:mobile/app/data/providers/permission.provider.dart';

class PermissionRepository {
  final PermissionApiClient apiClient = PermissionApiClient();

  Future<List<Permission>> getPermission(String iduser) async {
    var dados = await apiClient.getPermissions(iduser);
    if (dados != null) return Permissions.fromJson(dados!).getPermissions();
    return List<Permission>.empty();
  }
}
