import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreencomp extends StatelessWidget {
  final AssetImage images;
  const OnBoardingScreencomp({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 690.h,
      width: 360.w,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: images,
        fit: BoxFit.cover,
      )),
    ));
  }
}
