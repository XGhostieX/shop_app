import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/helpers/cashe_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../helpers/app_router.dart';
import '../models/on_boarding.dart';
import '../styles/assets.dart';
import '../widgets/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;
  final List<OnBoarding> onBoardingItems = [
    OnBoarding(onboard_0, 'Sales and Gifts',
        'Holiday sales, Birthday gifts, Various choice and categories.'),
    OnBoarding(onboard_1, 'Online shopping',
        'Make an order sitting on sofa. Pay and choose online.'),
    OnBoarding(onboard_2, 'Open 24 Hour',
        'Yes, we are open for 24 hour, to produce a high quality service for you'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: submit, child: const Text('SKIP'))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (value) {
                  if (value == onBoardingItems.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    OnBoardingItem(onBoardingItem: onBoardingItems[index]),
                itemCount: onBoardingItems.length,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.grey,
                    spacing: 5,
                    expansionFactor: 4,
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                  controller: boardController,
                  count: onBoardingItems.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    CasheHelper.setData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        GoRouter.of(context).pushReplacement(
          AppRouter.loginScreen,
        );
      }
    });
  }
}
