import 'package:flutter/material.dart';
import 'package:page_indicator_plus/page_indicator_plus.dart';

class PageIndicatorBuilder extends StatelessWidget {
  final PageController pageController;
  final int cardCount;
  const PageIndicatorBuilder(
      {super.key, required this.pageController, required this.cardCount});

  @override
  Widget build(BuildContext context) {
    return PageIndicator(
      controller: pageController,
      count: cardCount,
      layout: PageIndicatorLayout.WARM,
      scale: 0.65,
      space: 10,
    );
  }
}
