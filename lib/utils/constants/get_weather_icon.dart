

import 'package:weather/utils/constants/image_strings.dart';

String getWeatherIcon({required int weatherCode}) {
  String weatherCondition = '';

  if (weatherCode == 801) {
    weatherCondition = AppImages.fewClouds;
  } else if (weatherCode == 802) {
    weatherCondition = AppImages.fewClouds;
  } else if (weatherCode == 803) {
    weatherCondition = AppImages.partlyCloudy;
  } else if (weatherCode == 804) {
    weatherCondition = AppImages.partlyCloudy;
  } else if (weatherCode == 800) {
    weatherCondition = AppImages.clearSky;
  } else if (weatherCode > 700) {
    weatherCondition = AppImages.fogTornado;
  } else if (weatherCode >= 600) {
    weatherCondition = AppImages.snow;
  } else if (weatherCode >= 500) {
    weatherCondition = AppImages.rain;
  } else if (weatherCode >= 300) {
    weatherCondition = AppImages.drizzle;
  } else if (weatherCode >= 200) {
    weatherCondition = AppImages.thunderstorm;
  }

  return weatherCondition;
}

String getWeatherIcon2(int id) {
  if (id == 0) {
    return AppImages.clearSky;
  }
  if (id == 1) {
    return AppImages.clearSky;
  }
  if (id == 2) {
    return AppImages.fewClouds;
  }
  if (id == 3) {
    return AppImages.partlyCloudy;
  }
  if (id == 45) {
    return AppImages.partlyCloudy;
  }
  if (id == 48) {
    return AppImages.partlyCloudy;
  }
  if (id == 53) {
    return AppImages.fogTornado;
  }
  if (id > 50 && id < 60) {
    return AppImages.drizzle;
  }
  if (id > 60 && id < 70) {
    return AppImages.snow;
  }
  if (id >= 70 && id < 80) {
    return AppImages.partlyCloudy;
  }
  if (id >= 80 && id < 85) {
    return AppImages.thunderstorm;
  }
  if (id > 85) {
    return AppImages.snow;
  }

  return AppImages.clearSky;
}