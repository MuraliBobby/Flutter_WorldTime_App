import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(uri: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(uri: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(uri: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(uri: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(uri: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(uri: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(uri: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(uri: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(uri: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
  ];

  void updateTime(index) async{
    WorldTime instance  = locations[index];
    await instance.getTime();
    // print(instance.location);
    // print(instance.time);

    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.dayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title:Text(locations[index].location),
              // leading: CircleAvatar(
              //   backgroundImage: AssetImage('assets/${locations[index].flag}'),
              //
              // ),
            ),
          );
        },
      ),
    );
  }
}
