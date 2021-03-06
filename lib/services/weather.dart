




import 'location.dart';
import 'networking.dart';
const apiKey = '7c2fe045e2b1115fdbf30c2215bc4a18';
class WeatherModel {
  Future getLocationData(String city)async{

    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {

      'appid': apiKey,
      'units': 'metric',
      'q'    : '$city'

    });
    NetworkHelper nes = NetworkHelper(uri);
    var data = await nes.getData();
    return data;
  }

  Future getWeatherData()async{
    Location location = new Location();
    await location.getCurrentPosition();
    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': location.latitude,
      'lon': location.longitude,
      'appid': apiKey,
      'units': 'metric'

    });
    NetworkHelper net = NetworkHelper(uri);
    var decodedData = await net.getData();
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
