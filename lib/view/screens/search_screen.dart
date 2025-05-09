import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/utils/constants/colors.dart';
import 'package:weather/utils/constants/text_constants.dart';
import 'package:weather/view/widgets/searched_city_weather.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final searchedWeatherState = ref.watch(searchWeatherViewModelProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: cityController,
                      style: TextTheme.of(context).titleMedium,
                      decoration: InputDecoration(
                        hintText: AppTextConstants.enterCityName.toLowerCase(),
                        filled: true,
                        errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.error),
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: IconButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            ref
                                .read(searchWeatherViewModelProvider.notifier)
                                .fetchWeatherDataOfSearchedCity(cityController.text.trim());
                          }
                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (searchedWeatherState.isLoading)
              CircularProgressIndicator()
            else if (searchedWeatherState.error != null)
              Text(
                searchedWeatherState.error ?? AppTextConstants.error,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.error),
              )
            else
              Expanded(
                child: GridView.builder(
                  itemCount: searchedWeatherState.recentCityWeather.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (ctx, index) {
                    final weather = searchedWeatherState.recentCityWeather[index];
                    return SearchedCityWeather(weather: weather);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
