import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._();

  late SharedPreferences _storage;

  static final Storage instance = Storage._();

  Future<void> initialize() async {
    _storage = await SharedPreferences.getInstance();
  }

  String? get accessToken => _storage.getString('accessToken');
  Future<bool> setAccessToken(final String access) async {
    return _storage.setString('accessToken', access);
  }

  String? get refreshToken => _storage.getString('refreshToken');
  Future<bool> setRefreshToken(final String refresh) async {
    return _storage.setString('refreshToken', refresh);
  }

  Future<bool> logout() async {
    bool response = true;
    response &= await _storage.remove('accessToken');
    response &= await _storage.remove('refreshToken');
    return response;
  }
}
