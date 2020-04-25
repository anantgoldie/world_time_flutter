import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  static const routeName = '/chooseLocation';

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> countries = [
    WorldTime(url: "Europe/Berlin", location: "Germany", flag: "germany.png"),
    WorldTime(url: "America/New_York", location: "USA", flag: "usa.png")
  ];

  void updateTime(index) async {
    WorldTime newCountry = countries[index];
    await newCountry.getCountryData();
    Navigator.pop(context, newCountry);
  }

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
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
                child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(countries[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/${countries[index].flag}"),
              ),
            )),
          );
        },
      ),
    );
  }
}
