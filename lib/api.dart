import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class AuthServices {

  var ServerUrl = "https";
  var status;
  var token;

void registerData(String phone_number, String username, String password,) async {
  final response = await http.post(
    Uri.parse('https://'),
    headers: {'Accept': 'application/json'},
    body: {
      "phone_number": "$phone_number",
      "username": "$username",
      "password": "$password",
    },
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print('data : $data');
    // save(data["access_token"]);
  } else {
    print('Error: ${response.reasonPhrase}');
  }
}







  save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}