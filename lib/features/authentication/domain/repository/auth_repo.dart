// ignore_for_file: unused_local_variable

import 'package:auth_task/features/authentication/data/base/apiBase.dart';
import 'package:auth_task/features/authentication/data/constant/const.dart';

class LoginRepo {
  final ApiBase apiBase = ApiBase();

  Future<dynamic> login(
      {required String email, required String password}) async {
    Map<String, dynamic> resBody = {"email": email, "password": password};
    final response = await apiBase.postRequest(url: apiLogin, body: resBody);
    print(" the response is  : $response");
    return response;
  }
}

class RegisterRepo {
  final ApiBase apiBase = ApiBase();

  Future<dynamic> register(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    Map<String, dynamic> resBody = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password
    };
    final response = await apiBase.postRequest(url: apiRegister, body: resBody);
    print(" the response is  : $response");
    return response;
  }
}
