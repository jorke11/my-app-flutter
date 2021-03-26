import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountAPI {
  Future<bool> login(String email, String password) async {
    try {
      final http.Response response = await http.post(
          "https://reqres.in/api/login",
          body: jsonEncode({"email": email, "password": password}),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final dynamic parsed = jsonDecode(response.body);
        print("Login ok ${parsed["token"]}");
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<dynamic>> getUsers(int page) async {
    try {
      final http.Response response =
          await http.get("https://reqres.in/api/users?page=$page&delay=3");

                  print(response.body);

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("get Users");
        print(parsed["data"].runtimeType);
        return parsed["data"];
      }
      print("error ${response.statusCode}");
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
