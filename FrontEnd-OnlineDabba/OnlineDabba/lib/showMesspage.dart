import 'package:flutter/material.dart';
import 'MessModel.dart';

class ShowMessPage extends StatefulWidget {
  const ShowMessPage({Key? key}) : super(key: key);

  @override
  _ShowMessPageState createState() => _ShowMessPageState();
}

class _ShowMessPageState extends State<ShowMessPage> {
  late MessData messData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    messData = ModalRoute.of(context)!.settings.arguments as MessData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mess Details'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.teal,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.restaurant,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8),
                  Text(
                    messData.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Date Created: ${messData.dateStarted.day}/${messData.dateStarted.month}/${messData.dateStarted.year}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Address: ${messData.address}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Phone Number: ${messData.phoneNumber}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Total Active Users: ${messData.subscribed.length}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total Ratings: ${messData.avgRatings}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          color: Colors.black26
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'User Rating $index',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
