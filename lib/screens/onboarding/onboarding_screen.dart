import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:music_app/utils/colors.dart';
import 'package:music_app/utils/text.dart';

import 'components/onboarding_screen_comp.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<Widget> onboardingScreens = [
    const OnBoardingScreencomp(
      images: AssetImage('assets/images/images (1).jpg'),
    ),
    const OnBoardingScreencomp(
      images: AssetImage('assets/images/images (2).jpg'),
    ),
    const OnBoardingScreencomp(
      images: AssetImage('assets/images/images.jpg'),
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: onboardingScreens,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 270.h,
              decoration: BoxDecoration(
                  color: Appcolors.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.w),
                      topRight: Radius.circular(60.w))),
              // height: 200.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentIndex == 0
                        ? "User friendly mp3\nmusic player for\nyour device"
                        : currentIndex == 1
                            ? 'We provide a better\naudio experience\nthan others'
                            : currentIndex == 2
                                ? "Listen to the best\naudio and music with\nMume now"
                                : '',
                    style: appdescription,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingScreens.length,
                      (index) => Container(
                        width: 10.w,
                        height: 10.w,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          shape: index == currentIndex
                              ? BoxShape.circle
                              : BoxShape.circle,
                          color: index == currentIndex
                              ? Appcolors.orangeColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                        fixedSize: Size(270.w, 45.h),
                        backgroundColor: Appcolors.orangeColor),
                    onPressed: () {
                      if (currentIndex < onboardingScreens.length - 1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationBarss()));
                      }
                    },
                    child: Text(
                      currentIndex < onboardingScreens.length - 1
                          ? 'Next'
                          : "Let's Go",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
