//import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

//create a class to get the current location and coordinates

class Location {
  double longitude;
  double latitude;

  Location({this.longitude, this.latitude});

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
