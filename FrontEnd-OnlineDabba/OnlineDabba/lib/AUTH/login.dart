import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:onlinedabba/UserModel.dart';
import 'package:onlinedabba/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to continue!!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your login logic here
                String email = emailController.text;
                String password = passwordController.text;
                postloginreq(email, password);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postloginreq(email,pass) async {
    var URL = "${Utils.URL}/user/login";
    var body = {
      'email': email,
      'password': pass,
    };
    var headers = {
      'Content-Type': 'application/json',
    };
    var res = await http.post(
      Uri.parse(URL),
      headers: headers,
      body: jsonEncode(body),
    );
    if (res.statusCode.toString()[0] == '2') {
      Map<String, dynamic> map = jsonDecode(res.body);
      var token=map['token'];
      var prefs= await SharedPreferences.getInstance();
      prefs.setString('token', token);
      Fluttertoast.showToast(msg: "Successfully Logged IN: "+token);
      Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
    } else {
      Fluttertoast.showToast(msg: res.body.toString());
    }
  }
}
