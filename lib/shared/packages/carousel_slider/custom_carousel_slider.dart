import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

PageController carouselPageController =
    PageController(initialPage: 0, viewportFraction: 0.8);

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({Key? key, required this.items}) : super(key: key);
  final List<Widget> items; // list for test

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  @override
  void initState() {
    carouselPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  void dispose() {
    carouselPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: CardCarousel(
        pageController: carouselPageController,
        items: widget.items,
      ),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class CardCarousel extends StatelessWidget {
  final PageController pageController;
  final List<Widget> items;

  const CardCarousel({
    super.key,
    required this.pageController,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 350.0,
          width: double.infinity,
          child: PageView.builder(
            controller: pageController,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return _cardBuilder(context, index);
            },
          ),
        ),
      ],
    );
  }

  _cardBuilder(BuildContext context, int index) {
    var item = items[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        child = item;
        if (kDebugMode) {
          print(child);
        }
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = (pageController.page! - index);
          value = (1 - (value.abs() * 0.25)).clamp(0, 1.0);
          // you can change these values to change the size
          // transformation that i found it
        }

        return Center(
          child: SizedBox(
            // color: Colors.green,
            // change animation right here
            // the value for transform have got above
            height: Curves.easeInOut.transform(value) * 350.0,
            child: child,
          ),
        );
      },
    );
  }
}
