import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location = "";
  String flag = "";
  String time = "";
  String uri = "";
  bool dayTime = false;

  // WorldTime(String location, String flag, String uri) {
  //   this.location = location;
  //   this.flag = flag;
  //   this.uri = uri;
  // }

  WorldTime({this.location = "", this.flag="", this.uri=""});


  Future<void> getTime() async {
    // String r = uri+extension;
    // print(r);


    try{
      Uri url = Uri.parse("http://worldtimeapi.org/api/timezone/$uri");
      // print(url);
      Response response = await get(url);
      // print(response.body);
      Map data = jsonDecode(response.body);
      // Get required properties
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      // print(dateTime);

      //Create datetime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // print(now);
      dayTime = now.hour > 6 && now.hour <18 ? true : false ;
      time = DateFormat.jm().format(now);

    }
    catch(e){
      time = "error fetching time";
    }

  }
}