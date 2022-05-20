import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weatherappdev/model/model.dart';
class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.paresWheatherDate});

  final paresWheatherDate;

  // const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // late double info;
  Model model = Model();
  late Widget icon;
  late String selectcityName;
  late double temp;
  late String des;
  var date = DateTime.now();
  @override
  void initState() {
    super.initState();
    updateData(widget.paresWheatherDate);
  }

  void updateData(dynamic weatherData) {
    // info = weatherData["weather"]["description"];
    // print(info);
    temp = weatherData['main']['temp'];
    print(temp);
    selectcityName = weatherData['name'];
    int condition = weatherData['weather'][0]['id'];
    des = weatherData['weather'][0]['description'];
    icon = model.getWeatherIcon(condition)!;
    print(selectcityName);
  }

  String getSystemTime() {
    var now = DateTime.now();

    return DateFormat("h:mm a").format(now);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // title: Text("weatherApp"),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.near_me,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              ;
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                ;
              },
              icon: Icon(
                Icons.location_searching,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            SizedBox(
              width: 6,
            )
          ],
          elevation: 0,
        ),
        body: Container(
          child: Stack(
            children: [
              Image.asset(
                'images/background.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150.0,
                              ),
                              Text(
                                "${selectcityName}",
                                style: GoogleFonts.lato(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  TimerBuilder.periodic(
                                    (Duration(minutes: 1)),
                                    builder: (context) {
                                      print("${getSystemTime()}");
                                      return Text(
                                        '${getSystemTime()}',
                                        style: GoogleFonts.lato(
                                            fontSize: 16, color: Colors.white),
                                      );
                                    },
                                  ),
                                  Text(
                                    DateFormat(' - EEEE').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    DateFormat(' - yyy MMM d').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${temp}\u2103",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 85,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  icon,
                                  SizedBox(width: 10.0),
                                  Text('$des',
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Divider(
                          height: 15,
                          thickness: 2.0,
                          color: Colors.white30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "AQI(대기질 지수)",
                                  style: GoogleFonts.lato(
                                      fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Image.asset(
                                  "images/bad.png",
                                  width: 37,
                                  height: 35,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "매우 나쁨",
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "미세먼지",
                                  style: GoogleFonts.lato(
                                      fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "174.75",
                                  style: GoogleFonts.lato(
                                      fontSize: 26, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "㎍/m³",
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "초미세먼지",
                                  style: GoogleFonts.lato(
                                      fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "84.03",
                                  style: GoogleFonts.lato(
                                      fontSize: 26, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "㎍/m³",
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
