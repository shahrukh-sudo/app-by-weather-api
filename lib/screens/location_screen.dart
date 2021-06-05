import 'package:flutter/material.dart';
import 'package:flutter_clima/screens/city_screen.dart';
import 'package:flutter_clima/services/weather.dart';
import 'package:flutter_clima/utilities/constants.dart';


class LocationScreen extends StatefulWidget {

   LocationScreen({this.locationWeatherData});
   var locationWeatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();

  int temp;
  String cityName;
  var condition;
  String weatherIcon;
  String current;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeatherData);
  }

  void updateUI(var weatherData){
   setState(() {
     if(weatherData  == Null){
       temp = 0;
       current ='error';
       weatherIcon = 'error';
     }
     var temperature = weatherData['main']['temp'];
       temp = temperature.toInt();
       cityName = weatherData['name'];
       condition = weatherData['weather'][0]['id'];
       current = weatherModel.getMessage(temp);
      weatherIcon = weatherModel.getWeatherIcon(condition);
   });



  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getWeatherData();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: ()  async{
                      var typedName =await Navigator.push(context, MaterialPageRoute(builder: (context) =>CityScreen() ),);
                      if(typedName != Null){
                        var cdata = await weatherModel.getLocationData(typedName);
                      updateUI(cdata);
                      }

                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$current in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
