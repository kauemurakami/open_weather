import 'package:flutter/material.dart';

class LoadgingWidget extends StatelessWidget {
  const LoadgingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator.adaptive(),
      ],
    );
  }
}
