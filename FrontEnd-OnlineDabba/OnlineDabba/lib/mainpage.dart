import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'MessModel.dart';
import 'Utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MessData> messDataList = [];
  GlobalKey<RefreshIndicatorState> refreshKey =
  GlobalKey<RefreshIndicatorState>();

  Future<void> _fetchData() async {
    var URL = "${Utils.URL}/mess/fetchall";
    var res = await http.get(
      Uri.parse(URL),
    );
    if (res.statusCode.toString()[0] == '2') {
      Map<String, dynamic> map = jsonDecode(res.body);
      messDataList.clear();
      for (var data in map['data']) {
        MessData messData = MessData.fromJson(data);
        messDataList.add(messData);
      }
    } else {
      Fluttertoast.showToast(msg: res.body.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      refreshKey.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            padding: EdgeInsets.fromLTRB(20, 40, 30, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Online Dabba",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: RefreshIndicator(
              key: refreshKey,
              onRefresh: () async {
                await _fetchData();
                setState(() {});
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10),
                itemCount: messDataList.length,
                itemBuilder: (context, index) {
                  MessData messData = messDataList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'showMesspage',
                        arguments: messDataList[index], // Pass the MessData object as an argument
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: Colors.black26,
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.restaurant,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messData.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                messData.address,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Active: ${messData.subscribed.length}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '${messData.dateStarted.day}/${messData.dateStarted.month}/${messData.dateStarted.year}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
