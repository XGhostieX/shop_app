import 'package:flutter/material.dart';

import '../models/on_boarding.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoarding onBoardingItem;
  const OnBoardingItem({
    Key? key,
    required this.onBoardingItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset(onBoardingItem.image)),
        // const SizedBox(height: 30),
        Text(
          onBoardingItem.title,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Lemonada',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          onBoardingItem.body,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Lemonada',
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
