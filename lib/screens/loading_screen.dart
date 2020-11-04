import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zeta_clima/screens/location_screen.dart';
import 'package:zeta_clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //this get triggered anytime the app is restarted.
  void initState() {
    super.initState();
    getLocationData();
  }

  // get Location Data function from Weather Class:
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(locationWeather: weatherData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/loadscreen.jpg'),
          fit: BoxFit.cover,
        )),
        constraints: BoxConstraints.expand(),
        child: Center(
          child: SpinKitChasingDots(
            color: Colors.yellow,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
