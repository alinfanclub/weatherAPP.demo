import 'package:geolocator/geolocator.dart';

class MyLocation {
  late double longitude2;
  late double latitude2;

  Future<void> getMyCurrentLocation() async{
    LocationPermission permission = await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitude2 = position.longitude;
      latitude2 = position.latitude;
      print(position);
      print(latitude2);
      print(longitude2);
    } catch (e) {
      print('There was a problem with  the internet connection');
    }
  }
}