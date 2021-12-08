import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_application_6/services/dio.dart';

class Auth extends ChangeNotifier {
  bool _isloggedIn = false;

  bool get authenticated => _isloggedIn;

  void login(Map creds) async {
    print(creds);
    try {
      Dio.Response response = await dio().post('/sanctum/token', data: creds);
      // ignore: avoid_print
      print(response.data.toString());
      _isloggedIn = true;

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  void logout() {
    _isloggedIn = false;
    notifyListeners();
  }
}
