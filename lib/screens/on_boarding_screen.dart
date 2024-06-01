// onboarding_screen.dart

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_application_1/screens/on_board_controller.dart';
import 'package:flutter_application_1/screens/text.dart';
import 'package:flutter_application_1/screens/images.dart';
import 'package:get/get.dart'; 

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: Images.OnBoardingImage1,
                text: Texts.OnBoardingtext1,
              ),
              OnBoardingPage(
                image: Images.OnBoardingImage2,
                text: Texts.OnBoardingtext2,
              ),
            ],
          ),
          OnBoardingSkip(),
          OnBoardingDotNavigation(),
          NavigatingArrow(),
        ],
      ),
    );
  }
}

class NavigatingArrow extends StatelessWidget {
  const NavigatingArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24.0,
      bottom: kBottomNavigationBarHeight ,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 49, 106, 228),
          minimumSize: const Size(56, 56),
        ),
        child: const Icon(
          Icons.arrow_forward,
          size: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight,
      right: 24.0,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text(
          'Skip',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      left: 34.0,
      bottom: kBottomNavigationBarHeight,
      child: SmoothPageIndicator(
        count: 2,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          dotHeight: 6.0,
          dotWidth: 13.17,
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          PageView(
            children: [
              Column(
                children: [
                  Container(
                    width: 320.0,
                    height: 320.0,
                    margin: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 60.0),
                    child: Center(
                      child: Image(
                        image: AssetImage(image),
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    margin: const EdgeInsets.fromLTRB(0.0, 30.0, 30.0, 0.0),
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: Color(0xFF221f1f),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
