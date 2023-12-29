import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    CheckforloggedIN();
  }

  Future<void> CheckforloggedIN() async {
    await Future.delayed(Duration(microseconds: 3000));
    var prefs= await SharedPreferences.getInstance();
    Fluttertoast.showToast(msg: prefs.getString('token').toString());
    if(prefs.getString('token') == null){
      Navigator.pushNamedAndRemoveUntil(context,'welcome', (route) => false);
    }
    else Navigator.pushNamedAndRemoveUntil(context,'home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Online Dabba",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87,fontSize: 30)),
      ),
    );
  }
}
