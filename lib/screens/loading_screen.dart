import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clima/screens/location_screen.dart';
import 'package:flutter_clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';






class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String latitude;
  String longitude;
  @override
  void initState() {

   getLocationData();


    super.initState();
  }

 void getLocationData()async {
    WeatherModel weatherModel = WeatherModel();

    var decodedData = await weatherModel.getWeatherData();
    var temperature = decodedData['main']['temp'];
    print(temperature);
    Navigator.push(context,MaterialPageRoute(builder: (context)=>LocationScreen(
    locationWeatherData: decodedData,
    )));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          size: 100.0,
          color: Colors.white60,
        ),

      ),
    );
  }
}
