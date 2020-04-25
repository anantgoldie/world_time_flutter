import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getLocationData() async {
    print("start");
    http.Response response = await http.get(
        "https://jsonplaceholder.typicode.com/todos/1",
        headers: {"accept": "Application/json"});

    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("loading screen."),
    );
  }
}
