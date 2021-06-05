


import 'package:geolocator/geolocator.dart';

class Location{

  String latitude;
  String longitude;
  Future getCurrentPosition()async{
    try{
      print("bv");
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
      }
    catch(e){
      print(e);
    }

  }


}
