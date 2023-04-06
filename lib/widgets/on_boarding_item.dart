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
      children: [
        Expanded(child: Image.asset(onBoardingItem.image)),
        const SizedBox(height: 30),
        Text(
          onBoardingItem.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          onBoardingItem.body,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
