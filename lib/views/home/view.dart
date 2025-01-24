import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_wheater/view-model/home/home_bloc.dart';
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
                          Text(
                            '${state.weather.name}°',
                            style: const TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600),
                          ),
                          
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
