import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  static const routeName = '/chooseLocation';

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: Text("Choose Location"),
        centerTitle: true,
        backgroundColor: Colors.blue[587],
      ),
      body: Text("Body"),
    );
  }
}
