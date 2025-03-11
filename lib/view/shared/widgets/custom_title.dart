import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontSize: 18,
            fontWeight: FontWeight.bold));

    
  }
}
