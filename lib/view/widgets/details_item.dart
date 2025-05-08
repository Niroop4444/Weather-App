import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;

  const DetailsItem({super.key, required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(icon, height: 25,),
        Text(value, style: Theme.of(context).textTheme.titleMedium,),
        Text(title, style: Theme.of(context).textTheme.bodySmall,)
      ],
    );
  }
}
