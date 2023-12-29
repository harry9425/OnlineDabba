import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome to OnlineDabba Please login or signup from below options:",softWrap: true,style:TextStyle(color: Colors.black87,fontSize:20,fontWeight: FontWeight.w600),),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context,'login');
                      },
                      child: Text("Login",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding: EdgeInsets.all(20),
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Set the border radius here
                      ),
                    ),
                  )),
                  SizedBox(width: 20,),
                  Expanded(child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context,'signup');
                    },
                    child: Text("Signup",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding: EdgeInsets.all(20),
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Set the border radius here
                      ),
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
