import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:onlinedabba/UserModel.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onlinedabba/Utils/utils.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter Your Details:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm Password'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  var obj= {
                  "name": nameController.text.toString(),
                  "email": emailController.text.toString(),
                  "password" :passwordController.text.toString(),
                  "confirmpassword" : confirmPasswordController.text.toString(),
                  "phonenumber" : phoneNumberController.text.toString(),
                    "role":"seller"
                };
                  postsignup(obj);
                },
                child: Text('Register as Seller'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  var obj= {
                    "name": nameController.text.toString(),
                    "email": emailController.text.toString(),
                    "password" :passwordController.text.toString(),
                    "confirmpassword" : confirmPasswordController.text.toString(),
                    "phonenumber" : phoneNumberController.text.toString(),
                    "role":"user"
                  };
                  postsignup(obj);
                },
                child: Text('Register as User'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postsignup(body) async {
    var URL = "${Utils.URL}/user/signup";
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
      Fluttertoast.showToast(msg: map.toString());
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
    } else {
      Fluttertoast.showToast(msg: res.body.toString());
    }
  }

}
