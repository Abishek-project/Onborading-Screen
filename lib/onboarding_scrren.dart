import 'package:flutter/material.dart';
import 'package:onboarding_screen/components/onboard_widget.dart';
import 'package:onboarding_screen/model/onboard.dart';

import 'components/dot_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<Onboard> collections = [
    Onboard("assets/onboarding1.svg", "Get Started in Minutes",
        "Join our community and start enjoying the benefits right away"),
    Onboard("assets/onborading2.svg", "Your Gateway to Success",
        " provide you with valuable insights, tips, and tools to maximize your productivity, achieve your goals, and thrive in your endeavors"),
    Onboard("assets/onborading3.svg", "Join a Thriving Community",
        " will introduce you to a network of professionals, fostering connections, collaboration, and growth opportunities"),
    Onboard("assets/onboarding4.svg", "Welcome to a World of Convenience",
        "will guide you through the app's intuitive features, making your tasks easier and more efficient than ever before"),
  ];
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController!.dispose();

    super.dispose();
  }

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: collections.length,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingScreen(
                    image: collections[index].image,
                    title: collections[index].title,
                    description: collections[index].description,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...List.generate(
                      collections.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(isActive: index == pageIndex),
                          )),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(shape: const CircleBorder()),
                      onPressed: () {
                        pageController?.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      child: const Center(
                          child: Icon(Icons.arrow_right_alt_sharp)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
