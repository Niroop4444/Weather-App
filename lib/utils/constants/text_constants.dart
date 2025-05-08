class AppTextConstants {

  static const String fontFamily = "Nunito";

  static const String apiKey = "API_KEY";

  static const String weather = "weather";
  static const String forecast = "forecast";
  static const String metric = "metric";
  static const String weatherCode = "weather_code";
  static const String maxTemp = "temperature_2m_max";
  static const String minTemp = "temperature_2m_min";
  static const String auto = "auto";
  static const String error = "Error";
  static const String degreeCelsius = "°C";
  static const String humidity = "Humidity";
  static const String feelsLike = "Feels like";
  static const String wind = "Wind";
  static const String meterPerSecond = "m/s";

  // Urls
  static const String baseOpenWeatherUrl = "https://api.openweathermap.org/data/2.5";
  static const String currentLocationWeatherUrl = "$baseOpenWeatherUrl/$weather";
  static const String currentLocationHourlyForecastUrl = "$baseOpenWeatherUrl/$forecast";
  static const String currentLocationWeeklyWeatherUrl = "https://api.open-meteo.com/v1/forecast";

  // Errors
  static const String enterCityName = "Enter city name";

  // Exceptions
  static const String apiKeyMissing = "API key is missing";
  static const String locationServiceDisabled = "Location services are disabled.";
  static const String locationPermissionsDenied = "Location permissions are denied.";
  static const String locationPermissionsPermanentlyDenied = "Location permissions are permanently denied.";
  static const String currentLocationException = "Failed to fetch current location weather data";
  static const String currentLocationHourlyException = "Failed to fetch hourly weather data";
  static const String currentLocationWeeklyException = "Failed to fetch weekly weather data";
  static const String selectedLocationException = "Failed to fetch weather data of";
  static const String recentWeatherException = "Failed to load recent weather data";

}