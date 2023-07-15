import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/screens/onboarding/onboarding_screen.dart';
import 'package:music_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 200.h,
              ),
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: const Image(
                  image: AssetImage("assets/images/image-removebg-preview.png"),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 4,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Appcolors.orangeColor),
                  ),
                ),
              ),
              SizedBox(
                height: 150.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
