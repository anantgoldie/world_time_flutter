import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  static const routeName = '/Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WorldTime timeObject;

  @override
  Widget build(BuildContext context) {
    timeObject = timeObject == null ? ModalRoute.of(context).settings.arguments : timeObject;

    String image = timeObject.isDayTime ? "assets/day.jpeg" : "assets/night.jpeg";

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image), 
                fit: BoxFit.cover
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, ChooseLocation.routeName);
                      setState(() {
                        timeObject = result;
                      });
                    },
                    icon: Icon(Icons.edit_location, color: Colors.white),
                    label: Text(
                      "Edit Location",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )),
                SizedBox(height: 20.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        timeObject.location,
                        style: TextStyle(fontSize: 20, letterSpacing: 2, color: Colors.white),
                      )
                    ]),
                SizedBox(height: 20),
                Text(
                  timeObject.time,
                  style: TextStyle(fontSize: 60, letterSpacing: 2, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
