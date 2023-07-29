import 'package:weatherify/services/location.dart';
import 'package:weatherify/services/networking.dart';

const apiKEY = 'ec026c47884185afaed0045f37bc5933';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    String apiURL = '$openWeatherMapURL?q=$cityName&appid=$apiKEY&units=metric';

    NetworkHelper networkHelper = NetworkHelper(apiURL);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    String apiURL =
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKEY&units=metric';

    NetworkHelper networkHelper = NetworkHelper(apiURL);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }
}
