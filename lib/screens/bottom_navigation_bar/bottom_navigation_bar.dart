import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/screens/home_screen/home_screen.dart';

import '../../utils/colors.dart';

class BottomNavigationBarss extends StatefulWidget {
  const BottomNavigationBarss({super.key});

  @override
  State<BottomNavigationBarss> createState() => _BottomNavigationBarssState();
}

class _BottomNavigationBarssState extends State<BottomNavigationBarss> {
  int myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      body: const HomeScreen(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SizedBox(
          height: 45.h,
          child: CustomNavigationBar(
            borderRadius: const Radius.circular(20),
            iconSize: 30.0,
            selectedColor: Appcolors.backgroundColor,
            strokeColor: Appcolors.backgroundColor,
            unSelectedColor: Colors.blueGrey,
            backgroundColor: Appcolors.orangeColor,
            isFloating: true,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(
                  FlutterRemix.home_2_fill,
                  size: 25,
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(
                  FlutterRemix.heart_2_fill,
                  size: 25,
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(
                  FlutterRemix.play_list_2_fill,
                  size: 25,
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(
                  FlutterRemix.settings_2_fill,
                  size: 25,
                ),
              ),
            ],
            currentIndex: myindex,
            onTap: (index) {
              setState(() {
                myindex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
