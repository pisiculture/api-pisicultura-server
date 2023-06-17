class System {
  static System? _instance;
  String _token = "";

  static System instance() {
    if (_instance == null) _instance = new System();
    return _instance!;
  }

  getToken() {
    return this._token;
  }

  setToken(String val) {
    _token = val;
  }
}
