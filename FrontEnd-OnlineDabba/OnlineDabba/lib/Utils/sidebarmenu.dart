import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onlinedabba/UserModel.dart';
import 'package:onlinedabba/Utils/marqueewidget.dart';
class Sidebarmenu extends StatefulWidget {
  Sidebarmenu({Key? key,required this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  State<Sidebarmenu> createState() => _SidebarmenuState();
}

class _SidebarmenuState extends State<Sidebarmenu> {

  var gpsdone=true;
  var list=[0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: 260,
        padding: EdgeInsets.only(left: 5, top: 8, bottom: 5, right: 5),
        height: double.infinity,
        color: Colors.black,
        child: SafeArea(

          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'account_edit');
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg?w=740"),
                    ),
                    title: MarqueeWidget(child: Text(
                      widget.userModel.name, style: TextStyle(color: Colors
                        .white, fontWeight: FontWeight.bold),)),
                    subtitle: Text("@" + widget.userModel.name,
                      style: TextStyle(color: Colors.grey),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 12, bottom: 16),
                  child: Text("BROWSE",
                    style: TextStyle(color: Colors.white70, fontSize: 18),),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Divider(color: Colors.white24, height: 1,),
                    ),
                    Stack(
                        children: [
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              height: 56,
                              width: list[0] == 1 ? 250 : 0,
                              child: Container(decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),)),
                          ListTile(
                            onTap: () {
                              setState(() {
                                list[0] = 1;
                              });
                              Future.delayed(Duration(milliseconds: 1000), () {
                                setState(() {
                                  list[0] = 0;
                                });
                                Navigator.pushNamed(context, 'allusers');
                              });
                            },
                            leading: SizedBox(
                              height: 34,
                              width: 34,
                              child: Container()
                            ),
                            title: Text("Search Users", style: TextStyle(
                                color: Colors.white),),
                          )
                        ])
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Divider(color: Colors.white24, height: 1,),
                    ),
                    Stack(
                        children: [
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              height: 56,
                              width: list[1] == 1 ? 250 : 0,
                              child: Container(decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),)),
                          ListTile(
                            onTap: () {
                              setState(() {
                                list[1] = 1;
                              });
                              Future.delayed(Duration(milliseconds: 1000), () {
                                setState(() {
                                  list[1] = 0;
                                });
                                Navigator.pushNamed(context, 'allthoughts');
                              });
                            },
                            leading: SizedBox(
                                height: 34,
                                width: 34,
                                child: Icon(
                                  Icons.bubble_chart, color: Colors.white,
                                  size: 30,)
                            ),
                            title: Text("Thoughts", style: TextStyle(
                                color: Colors.white),),
                          )
                        ])
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Divider(color: Colors.white24, height: 1,),
                    ),
                    Stack(
                        children: [
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              height: 56,
                              width: list[4] == 1 ? 250 : 0,
                              child: Container(decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),)),
                          ListTile(
                            onTap: () {
                              setState(() {
                                list[4] = 1;
                              });
                              Future.delayed(Duration(milliseconds: 1000), () {
                                setState(() {
                                  list[4] = 0;
                                });
                                Navigator.pushNamed(context, 'addthought');
                              });
                            },
                            leading: SizedBox(
                                height: 34,
                                width: 34,
                                child: Icon(Icons.add_circle_outline_sharp,
                                  color: Colors.white, size: 30,)
                            ),
                            title: Text("Post Thoughts", style: TextStyle(
                                color: Colors.white),),
                          )
                        ])
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Divider(color: Colors.white24, height: 1,),
                    ),
                    Stack(
                        children: [
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              height: 56,
                              width: list[3] == 1 ? 250 : 0,
                              child: Container(decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),)),
                          ListTile(
                            onTap: () {
                              setState(() {
                                list[3] = 1;
                              });
                              Future.delayed(Duration(seconds: 1), () {
                                setState(() {
                                  list[3] = 0;
                                });
                                Navigator.pushNamed(context, 'allchat');
                              });
                            },
                            leading: SizedBox(
                              height: 34,
                              width: 34,
                              child: Container()
                            ),
                            title: Text("Chat", style: TextStyle(
                                color: Colors.white),),
                          )
                        ])
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Divider(color: Colors.white24, height: 1,),
                    ),
                    Stack(
                        children: [
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              height: 56,
                              width: list[2] == 1 ? 250 : 0,
                              child: Container(decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),)),
                          ListTile(
                            onTap: () {
                              setState(() {
                                list[2] = 1;
                              });
                              Future.delayed(Duration(seconds: 1), () {
                                setState(() {
                                  list[2] = 0;
                                });
                                Navigator.pushNamed(context, 'friends');
                              });
                            },
                            leading: SizedBox(
                              height: 34,
                              width: 34,
                              child: Container()
                            ),
                            title: Text("Friends", style: TextStyle(
                                color: Colors.white),),
                          )
                        ])
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Divider(color: Colors.white24, height: 1,),
                    ),
                    Stack(
                        children: [
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              height: 56,
                              width: list[5] == 1 ? 250 : 0,
                              child: Container(decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),)),
                          ListTile(
                            onTap: () {
                              setState(() {
                                list[5] = 1;
                              });
                              Future.delayed(Duration(milliseconds: 1000), () {
                                setState(() {
                                  list[5] = 0;
                                });
                                Navigator.pushNamed(context, 'requestpage');
                              });
                            },
                            leading: SizedBox(
                                height: 34,
                                width: 34,
                                child: Icon(
                                  Icons.pending, color: Colors.white, size: 30,)
                            ),
                            title: Text("See Requests", style: TextStyle(
                                color: Colors.white),),
                          )
                        ])
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Divider(color: Colors.white24, height: 1,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 16, bottom: 16),
                  child: Text("Support",
                    style: TextStyle(color: Colors.white70, fontSize: 18),),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Divider(color: Colors.white24, height: 1,),
                    ),
                    Stack(
                        children: [
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              height: 56,
                              width: list[6] == 1 ? 250 : 0,
                              child: Container(decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),)),
                          ListTile(
                            onTap: () {
                              setState(() {
                                list[6] = 1;
                              });
                              Future.delayed(Duration(milliseconds: 1000), () {

                                setState(() {
                                  list[6] = 0;
                                });
                              });
                            },
                            leading: SizedBox(
                                height: 34,
                                width: 34,
                                child: Icon(Icons.bug_report_outlined,
                                  color: Colors.white, size: 30,)
                            ),
                            title: Text("Report Bugs", style: TextStyle(
                                color: Colors.white),),
                          )
                        ])
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Divider(color: Colors.white24, height: 1,),
                    ),
                    Stack(
                        children: [
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              height: 56,
                              width: list[7] == 1 ? 250 : 0,
                              child: Container(decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),)),
                          ListTile(
                            onTap: () {
                              setState(() {
                                list[7] = 1;
                              });
                              Future.delayed(Duration(milliseconds: 1000), () {
                                setState(() {
                                  list[7] = 0;
                                });
                              });
                            },
                            leading: SizedBox(
                                height: 34,
                                width: 34,
                                child: Icon(
                                  Icons.mail, color: Colors.white, size: 30,)
                            ),
                            title: Text("Send us E-mail", style: TextStyle(
                                color: Colors.white),),
                          )
                        ])
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Divider(color: Colors.white24, height: 1,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 16, bottom: 16),
                  child: Text("Others",
                    style: TextStyle(color: Colors.white70, fontSize: 18),),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Divider(color: Colors.white24, height: 1,),
                    ),
                    Stack(
                        children: [
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              height: 56,
                              width: list[8] == 1 ? 250 : 0,
                              child: Container(decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),)),
                          ListTile(
                            onTap: () {
                              setState(() {
                                list[8] = 1;
                              });
                              Future.delayed(Duration(milliseconds: 1000), () {
                                setState(() {
                                  list[8] = 0;
                                });
                              });
                            },
                            leading: SizedBox(
                                height: 34,
                                width: 34,
                                child: Icon(Icons.password, color: Colors.white,
                                  size: 30,)
                            ),
                            title: Text("Change PassCode", style: TextStyle(
                                color: Colors.white),),
                          )
                        ])
                  ],
                ),
                GestureDetector(
                  onLongPress: () {

                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Divider(color: Colors.white24, height: 1,),
                      ),
                      Stack(
                          children: [
                            AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                height: 56,
                                width: list[9] == 1 ? 250 : 0,
                                child: Container(decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),)),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  list[9] = 1;
                                });
                                Future.delayed(
                                    Duration(milliseconds: 1000), () {
                                  setState(() {
                                    list[9] = 0;
                                  });
                                });
                              },
                              leading: SizedBox(
                                  height: 34,
                                  width: 34,
                                  child: Icon(
                                    Icons.exit_to_app, color: Colors.white,
                                    size: 30,)
                              ),
                              title: Text("SignOut",
                                style: TextStyle(color: Colors.white),),
                            )
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}