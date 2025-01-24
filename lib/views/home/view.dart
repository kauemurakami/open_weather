import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_wheater/constants/text_theme.dart';
import 'package:open_wheater/view-model/home/home_bloc.dart';
import 'package:open_wheater/views/home/widgets/item.dart';
import 'package:open_wheater/widgets/loading_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: BlocBuilder<HomeBloc, HomeState>(
                bloc: context.read<HomeBloc>()..add(HomeLoadLocationEvent()),
                builder: (context, state) {
                  if (state is HomeInitial || state is HomeLoadingState) {
                    return const LoadgingWidget();
                  } else if (state is HomeLoadedState) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${state.weather.name}', style: AppTextTheme.subtitle),
                          ItemWidget(text: 'Latitude: ', value: '${state.weather.coord?.lat}'),
                          ItemWidget(text: 'Longitude : ', value: '${state.weather.coord?.lon}'),
                          ItemWidget(text: 'Temperature: ', value: '${state.weather.main?.temp}°'),
                          ItemWidget(text: 'Temp max : ', value: '${state.weather.main?.tempMax}°'),
                          ItemWidget(text: 'Temp min : ', value: '${state.weather.main?.tempMin}°'),
                          ItemWidget(text: 'Humidity : ', value: '${state.weather.main?.humidity}%'),
                          ItemWidget(text: 'Atm. Pressure sea level: ', value: '${state.weather.main?.seaLevel}'),
                          ItemWidget(text: 'Atm. Pressure solo level: ', value: '${state.weather.main?.grndLevel}'),
                          ItemWidget(text: 'Wind Vel: ', value: '${state.weather.wind?.speed} m/s'),
                          ItemWidget(text: 'Wind Direction: ', value: '${state.weather.wind?.deg}°'),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
