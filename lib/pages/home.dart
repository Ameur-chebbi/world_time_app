import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //                                    DATA from loading page
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    // {     "time": timeNow ,     "location": timeZone,    "isDayTime": false  }
    String bgimg = data["isDayTime"] ? "day.png" : "night.png";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 55, 53, 63),
          image: DecorationImage(
              image: AssetImage("assets/$bgimg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  // ignore: unused_local_variable
                  dynamic result =
                      await Navigator.pushNamed(context, '/Location');
                  setState(() {
                    if(result==null) {
                       data = {
                      "time":" !!! ",
                      "location": "please choose a location",
                      "isDayTime":false ,
                    };
                    }
                    else {
                    data = {
                      "time": result["time"],
                      "location": result["location"],
                      "isDayTime": result["isDayTime"]
                    };}
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(229, 125, 136, 233)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 33),
                color: Color.fromARGB(111, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      data["time"],
                      style: TextStyle(fontSize: 55, color: Colors.white),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      data["location"],
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
