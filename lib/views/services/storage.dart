import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FlutterSecureStorage storage = const FlutterSecureStorage();

class Storage {
  static Future setLogin(data) async {
    await storage.write(key: 'user', value: jsonEncode(data));
    return true;
  }

  static Future<dynamic> getLogin() async {
    dynamic value = await storage.read(key: 'user');
    if (value != null) {
      return jsonDecode(value);
    } else {
      return false;
    }
  }

  static Future<dynamic> setToken(token) async {
    await storage.write(key: 'token', value: token);
    return true;
  }

  static Future<dynamic> getToken() async {
    dynamic value = await storage.read(key: 'token');
    if (value != null) {
      return value;
    } else {
      return '';
    }
  }

  static Future<bool> logout() async {
    await storage.deleteAll();
    return true;
  }
}

