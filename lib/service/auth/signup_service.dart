import 'dart:convert';

import 'package:btcapp/utils/env.dart';
import 'package:http/http.dart' as http;

class SignupService {
  Future<Map<String, dynamic>> registerUser(
      String name, String username, String email, String password) async {
    print("Service called");
    final url = Uri.parse('$baseUrl/users/registration');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    print("MY_RESPNSE: " + response.body.toString());

    return json.decode(response.body);

    // if (response.statusCode == 200) {
    //   return jsonDecode(response.body);
    // } else {
    //   throw Exception('Failed to register user');
    // }
  }
}
