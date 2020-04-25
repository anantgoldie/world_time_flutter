import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String date;
  String time;
  String flag;
  String url;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      http.Response response =
          await http.get('http://worldtimeapi.org/api/timezone/$url');
      Map data = convert.jsonDecode(response.body);
    
      String datetime = data['datetime'];
      String offsetHrs = data['utc_offset'].substring(1, 3);
      String offsetMins = data['utc_offset'].substring(4);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offsetHrs), minutes: int.parse(offsetMins)));

      time = DateFormat.Hms().format(now);
      date = DateFormat.yMd().format(now);
    } catch (e) {
      print("error occurred = $e");
      time = "could not load time";
    }
  }
}
