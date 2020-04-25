import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: Loading.routeName,
      routes: {
        Loading.routeName: (context) => Loading(),
        Home.routeName: (context) => Home(),
        ChooseLocation.routeName: (context) => ChooseLocation()
      },
    ));
