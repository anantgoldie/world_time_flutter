import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    await timeInIndia.getCountryData();
    Navigator.pushReplacementNamed(context, Home.routeName,
        arguments: timeInIndia);
  }

  @override
  void initState() {
    super.initState();
    getTimeByLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: SpinKitRotatingCircle(color: Colors.white, size: 50.0),
        ),
      ),
    );
  }
}
