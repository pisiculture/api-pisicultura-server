import 'package:mobile/app/data/base_url.dart';
import 'package:mobile/app/data/providers/connect.dart';

class PermissionApiClient extends DwGetConnect {
  getPermissions(String iduser) async {
    var future = await getD("$baseUrlApp/api/permission/user/$iduser");
    return future.statusCode == 200 ? future.body : null;
  }
}
