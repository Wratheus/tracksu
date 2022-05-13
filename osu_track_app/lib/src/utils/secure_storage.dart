import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyRefreshToken = 'refresh_token';
  static const _keyToken = 'access_token';

  static Future setRefreshTokenFromStorage(String refreshToken) async =>
      await _storage.write(key: _keyRefreshToken, value: refreshToken);

  static Future<String?> getRefreshTokenFromStorage() async =>
      await _storage.read(key: _keyRefreshToken);

  static Future setTokenInStorage(String token) async =>
      await _storage.write(key: _keyToken, value: token);

  static Future<String?> getTokenFromStorage() async =>
      await _storage.read(key: _keyToken);
}