import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyTokenAsOwner = 'access_token';
  static const _keyToken = 'access_token';

  static Future setTokenAsOwnerInStorage(String token) async =>
      await _storage.write(key: _keyTokenAsOwner, value: token);

  static Future<String?> getTokenAsOwnerFromStorage() async =>
      await _storage.read(key: _keyTokenAsOwner);

  static Future setTokenInStorage(String token) async =>
      await _storage.write(key: _keyToken, value: token);

  static Future<String?> getTokenFromStorage() async =>
      await _storage.read(key: _keyToken);
}