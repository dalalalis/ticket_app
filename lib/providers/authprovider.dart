import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'client.dart';

class AuthProvider extends ChangeNotifier {
  String? username;
  int? password;
  String? first_name;
  String? last_name;

  Future<bool> signup({
    required String username,
    required String password,
    required String first_name,
    required String last_name,
  }) async {
    try {
      Client.dio.options.headers.remove("authorization");
      var response = await Client.dio
          .post("register/", // the path is taken from the backed urls to reg
              data: {
            "username": username,
            "password": password,
            "first_name": first_name,
            "last_name": last_name,
          });

      var token = response.data["access"];
      Client.dio.options.headers["authorization"] = "Bearer $token";
      this.username = username;

      var preferences = await SharedPreferences.getInstance();
      await preferences.setString("token", token);

      return true;
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      print("unknown error");
    }
    return false;
  }

  Future<String?> login(
      {required String username, required String password}) async {
    try {
      Client.dio.options.headers.remove("authorization");
      var response = await Client.dio
          .post("login/", // add the login path from backend urls
              data: {
            "username": username,
            "password": password,
          });

      var token = response.data["token"];

      Client.dio.options.headers["authorization"] = "Bearer $token";

      this.username = username;

      var preferences = await SharedPreferences.getInstance();
      await preferences.setString("token", token);

      return null; // when user login
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }

    return 'error'; // when user couldn't login
  }

  Future<bool> hasToken() async {
    // check if the token exist and not expired
    var preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");

    if (token != null && JwtDecoder.isExpired(token)) {
      var tokenMap = JwtDecoder.decode(token); // converting the token to map
      username = tokenMap["username"];
      return true;
    }
    return false;
  }

  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("token");
    username = null;
    Client.dio.options.headers.remove("authorization");
    notifyListeners();
  }
}
