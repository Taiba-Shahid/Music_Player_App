import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/player_controller.dart';
import 'package:music_app/helpers/capitalize_first.dart';
import 'package:music_app/utils/colors.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../helpers/format_time.dart';
import '../../utils/text.dart';

class PlayerScreen extends StatelessWidget {
  final SongModel song;

  const PlayerScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
   
    final PlayerController playerController = Get.put(PlayerController());
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.backgroundColor,
        elevation: 0,
        leading: const Icon(
          FlutterRemix.arrow_left_fill,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
                height: 200.h,
                width: 260.w,
                child: const Image(
                    image: AssetImage("assets/images/unnamed.png"))),
            SizedBox(
              height: 20.h,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  song.title.toCapitalize()!,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(song.artist.toString(),
                style: greytext.copyWith(fontSize: 11.sp)),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
            ),
            Obx(
              () => Slider(
                // max: double.parse(formatTime(song.duration!)),
                max: song.duration!.toDouble(),
                value: playerController.currentSongProgress.value,
                onChanged: (double value) {
                  playerController.currentSongProgress.value = value;
                },
                activeColor: Appcolors.orangeColor,
                inactiveColor: Colors.grey.shade200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      formatTime(
                          playerController.currentSongProgress.value.toInt()),
                      style: greytext.copyWith(fontSize: 11.sp),
                    ),
                  ),
                  Text(
                    " ${formatTime(song.duration!)}",
                    style: greytext.copyWith(fontSize: 11.sp),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FlutterRemix.skip_back_fill)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.replay_10)),
                CircleAvatar(
                  radius: 22,
                  foregroundColor: Appcolors.backgroundColor,
                  backgroundColor: Appcolors.orangeColor,
                  child: const Icon(
                    FlutterRemix.play_fill,
                    size: 28,
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.forward_10)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FlutterRemix.skip_forward_fill))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(FlutterRemix.time_line)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.access_time_filled_outlined)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FlutterRemix.more_2_fill))
              ],
            ),
            SizedBox(
              height: 14.h,
            )
          ],
        ),
      ),
    );
  }
}
