import 'package:flutter/material.dart';
import 'package:weatherappdev/data/network.dart';
import 'package:weatherappdev/screens/weather_screen.dart';
import '../data/my_location.dart';
const apiKey = "2d53c4f875034d038432c030e8c625e6";



class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late double longitude3;
  late double latitude3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation  myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();

    longitude3 = myLocation.longitude2;
    latitude3 = myLocation.latitude2;


    print(latitude3);
    print(longitude3);

    Network network = Network('https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context){return WeatherScreen(paresWheatherDate: weatherData,);}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ButtonTheme(
          child: RaisedButton(
        onPressed: null,
        child: Text(
          'Get My Location',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      )),
    ));
  }
}
