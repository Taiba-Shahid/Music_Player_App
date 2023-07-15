import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/songs_controller.dart';
import 'package:music_app/helpers/format_time.dart';
import 'package:music_app/screens/home_screen/components/songs_screen/filters_section.dart';
import 'package:music_app/utils/colors.dart';
import 'package:music_app/utils/text.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsView extends StatelessWidget {
  SongsView({super.key});

  final SongsController songsController = Get.put(SongsController());

  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Obx(
      () => FutureBuilder<List<SongModel>>(
          future: _audioQuery.querySongs(
              sortType: songsController.selectedFilter.value),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text(
                "Fault in fetcch songs",
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              );
            }
            List<SongModel> filteredsongs = snapshot.data!
                .where((element) => element.title.isNotEmpty)
                .toList();
            return Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: FilterSection(
                      filteredsongs: filteredsongs,
                      texttoadd: "Songs",
                    )),
                const Divider(
                  indent: 10.0,
                  endIndent: 10.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredsongs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: const Image(
                                image:
                                    AssetImage("assets/images/unnamed.png"))),
                        title: Text(
                          filteredsongs[index].title,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: CircleAvatar(
                          radius: 14,
                          foregroundColor: Appcolors.backgroundColor,
                          backgroundColor: Appcolors.orangeColor,
                          child: const Icon(
                            FlutterRemix.play_fill,
                            size: 20,
                          ),
                        ),
                        subtitle: IntrinsicHeight(
                          child: Row(
                            children: [
                              Text(filteredsongs[index].artist.toString(),
                                  style: greytext.copyWith(fontSize: 11.sp)),
                              const VerticalDivider(
                                thickness: 2,
                              ),
                              Text(
                                  " ${formatTime(filteredsongs[index].duration!)} mins",
                                  style: greytext.copyWith(fontSize: 11.sp)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    ));
  }
}
