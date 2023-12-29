import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:onlinedabba/UserModel.dart';
import 'package:onlinedabba/Utils/utils.dart';
import 'package:onlinedabba/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onlinedabba/Utils/sidebarmenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  late SharedPreferences prefs;
  UserModel userModel=new UserModel("User", "", "", "", "");
  List opofbottom=[0.5,0.5,1.0,0.5,0.5];
  int index=0;
  var issidemenuopen=false;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> scaleanimation;
  var gpsdone=false;


  @override
  void initState(){
    CheckforloggedIN();
    animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 200))..addListener(() {
      setState(() {
      });
    });
    super.initState();
    scaleanimation=Tween<double>(begin: 1,end: 0.8).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
    animation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
  }

  Future<void> CheckforloggedIN() async {
    prefs= await SharedPreferences.getInstance();
    if(prefs.getString('token') == null){
      Navigator.pushNamedAndRemoveUntil(context,'welcome', (route) => false);
    }
    else{
      var URL="${Utils.URL}/user/profile";
      var res= await http.get(
        Uri.parse(URL),
        headers: <String, String>{
        'Authorization': 'Bearer ${prefs.getString('token')}',
      },);
      Map<String,dynamic> map =jsonDecode(res.body);
      Map<String,dynamic> usermap =map['data'];
      userModel= new UserModel.fromMap(usermap);
      setState(() {
        userModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      body: Stack(children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          child: Sidebarmenu(userModel: userModel),width: MediaQuery.of(context).size.width*0.7,height: MediaQuery.of(context).size.height,left: issidemenuopen?0:-288,),
        Transform.translate(offset: Offset(animation.value*MediaQuery.of(context).size.width*0.7,0),
            child: ClipRRect(
              child: MainPage(),
              borderRadius: BorderRadius.circular(24),
            ),
        ),
        AnimatedPositioned(
          top: issidemenuopen?50:35,
          left: issidemenuopen?220: 15,
          duration: Duration(milliseconds: 200),
          child: GestureDetector(
            onTap: (){
              setState(() {
                issidemenuopen=!issidemenuopen;
              });
              if(issidemenuopen){
                animationController.forward();
              }
              else animationController.reverse();
              Future.delayed(Duration(milliseconds: 1000),(){
              });
            },
            child: Container(
              padding: EdgeInsets.all(6),
              child: Icon(issidemenuopen?Icons.clear:Icons.menu,color: Colors.white,size: 40,)
            ),
          ),
        ),
      ]
      )
    );
  }
}
