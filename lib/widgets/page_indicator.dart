import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorBuilder extends StatefulWidget {
  final PageController pageController;
  final int cardCount;
  const PageIndicatorBuilder(
      {super.key, required this.pageController, required this.cardCount});

  @override
  State<PageIndicatorBuilder> createState() => _PageIndicatorBuilderState();
}

class _PageIndicatorBuilderState extends State<PageIndicatorBuilder> {
  @override
  void initState() {
    super.initState();
    // Add listener to the page controller
    widget.pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    // Dispose of the listener
    widget.pageController.removeListener(_onPageChanged);
    super.dispose();
  }

  void _onPageChanged() {
    // Notify the framework that the state has changed
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: widget.pageController,
      count: widget.cardCount == 0 ? 1 : widget.cardCount,
      effect: ScrollingDotsEffect(
          activeDotColor: Theme.of(context).colorScheme.primary,
          dotWidth: 8,
          dotHeight: 8),
    );
  }
}
