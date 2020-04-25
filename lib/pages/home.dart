import 'package:flutter/material.dart';
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

    timeObject = ModalRoute.of(context).settings.arguments;
    // print(timeObject.time);
    // print(timeObject.location);
    // print(timeObject.date);


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Edit Location")
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    timeObject.location,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2
                    ),
                  )
                ]
              ),
              SizedBox(height: 20),
                  Text(
                    timeObject.time,
                    style: TextStyle(
                      fontSize: 60,
                      letterSpacing: 2
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
