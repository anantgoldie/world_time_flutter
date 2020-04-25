import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  static const routeName = '/loading';

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading ...";

  void getTimeByLocation() async {
    WorldTime timeInIndia =
        WorldTime(location: "Kolkata", flag: "india.png", url: "Asia/Kolkata");
    await timeInIndia.getTime();
    Navigator.pushReplacementNamed(context, Home.routeName, arguments: timeInIndia);
  }

  @override
  void initState() {
    super.initState();
    getTimeByLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
