import 'package:flutter/material.dart';
import 'package:open_wheater/constants/text_theme.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text, required this.value});
  final String text, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppTextTheme.subtitle),
        Text(value, style: AppTextTheme.normal),
      ],
    );
  }
}
