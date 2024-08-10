import 'package:flutter/material.dart';
import 'dart:async';

import 'package:lc_ui/Card.dart';

class LCCarousel extends StatefulWidget {
  final List<Widget> cards;
  final Axis scrollDirection;
  final Duration autoScrollDuration;
  final double spacing;
  final bool infiniteScroll;
  final double viewportFraction;
  final bool showIndicators;
  final Color indicatorColor;
  final Color activeIndicatorColor;
  final bool autoPlay;
  final Curve animationCurve;
  final Duration animationDuration;
  final void Function(int)? onPageChanged;
  final EdgeInsets padding;
  final double? height;

  const LCCarousel({
    Key? key,
    required this.cards,
    this.scrollDirection = Axis.horizontal,
    this.autoScrollDuration = const Duration(seconds: 5),
    this.spacing = 16.0,
    this.infiniteScroll = true,
    this.viewportFraction = 0.4,
    this.showIndicators = true,
    this.indicatorColor = Colors.grey,
    this.activeIndicatorColor = Colors.blue,
    this.autoPlay = true,
    this.animationCurve = Curves.easeInOut,
    this.animationDuration = const Duration(milliseconds: 300),
    this.onPageChanged,
    this.padding = EdgeInsets.zero,
    this.height,
  }) : super(key: key);

  @override
  _LCCarouselState createState() => _LCCarouselState();
}

class _LCCarouselState extends State<LCCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: widget.viewportFraction);
    if (widget.autoPlay) {
      _startAutoScroll();
    }
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (_currentPage < widget.cards.length - 1) {
        _currentPage++;
      } else if (widget.infiniteScroll) {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    });
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
  }

  void goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: widget.animationDuration,
      curve: widget.animationCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 300,
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanDown: (_) => _stopAutoScroll(),
              onPanCancel: () {
                if (widget.autoPlay) _startAutoScroll();
              },
              onPanEnd: (_) {
                if (widget.autoPlay) _startAutoScroll();
              },
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: widget.scrollDirection,
                itemCount: widget.infiniteScroll ? null : widget.cards.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index % widget.cards.length;
                  });
                  widget.onPageChanged?.call(_currentPage);
                },
                itemBuilder: (context, index) {
                  final cardIndex = index % widget.cards.length;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.scrollDirection == Axis.horizontal
                          ? widget.spacing / 2
                          : 0,
                      vertical: widget.scrollDirection == Axis.vertical
                          ? widget.spacing / 2
                          : 0,
                    ).add(widget.padding),
                    child: widget.cards[cardIndex],
                  );
                },
              ),
            ),
          ),
          if (widget.showIndicators)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.cards.length,
                  (index) => GestureDetector(
                    onTap: () => goToPage(index),
                    child: _buildIndicator(index),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? widget.activeIndicatorColor
            : widget.indicatorColor,
      ),
    );
  }
}
