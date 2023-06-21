import 'package:get/get.dart';
import 'package:mobile/app/global/singleton/system.dart';

class DwGetConnect extends GetConnect {
  String _contentType = 'application/json';
  Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  _addAuthHeader() {
    if (!System.instance().getToken().isBlank()) {
      _headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': System.instance().getToken()
      };
    }
  }

  _header() {
    if (_headers.isEmpty) _addAuthHeader();
    return _headers;
  }

  Future<Response<T>> send<T>(String url, String body) {
    return super.post(
      url,
      body,
      headers: _header(),
      contentType: _contentType,
    );
  }

  Future<Response<T>> find<T>(String url) {
    return super.get(url, headers: _header(), contentType: _contentType);
  }

  Future<Response<T>> remuve<T>(String url) {
    return super.delete(url, headers: _header(), contentType: _contentType);
  }

  Future<Response<T>> update<T>(String url, dynamic body) async {
    return httpClient.put<T>(url,
        body: body, headers: _header(), contentType: _contentType);
  }
}
