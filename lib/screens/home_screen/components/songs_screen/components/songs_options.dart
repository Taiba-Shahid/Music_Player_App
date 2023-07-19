import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/helpers/capitalize_first.dart';
import 'package:music_app/utils/colors.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../../helpers/format_time.dart';
import '../../../../../utils/text.dart';

class SongsOptions extends StatelessWidget {
  final SongModel song;
  const SongsOptions({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
          color: Appcolors.backgroundColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          ListTile(
            leading: SizedBox(
                height: 40.h,
                width: 40.w,
                child: const Image(
                    image: AssetImage("assets/images/unnamed.png"))),
            title: Text(
              song.title.toCapitalize()!,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(FlutterRemix.heart_2_line),
            subtitle: IntrinsicHeight(
              child: Row(
                children: [
                  Text(song.artist.toString(),
                      style: greytext.copyWith(fontSize: 11.sp)),
                  const VerticalDivider(
                    thickness: 2,
                  ),
                  Text(" ${formatTime(song.duration!)} mins",
                      style: greytext.copyWith(fontSize: 11.sp)),
                ],
              ),
            ),
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(
              FlutterRemix.play_fill,
              color: Colors.black,
            ),
            title: Text(
              "Play",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(
              FlutterRemix.user_2_fill,
              color: Colors.black,
            ),
            title: Text(
              "Go to Artist",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
