import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/songs_controller.dart';
import 'package:music_app/helpers/capitalize_first.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../utils/colors.dart';

class FilterSection extends StatelessWidget {
  final List<SongModel> filteredsongs;
  final String texttoadd;

  FilterSection(
      {super.key, required this.filteredsongs, required this.texttoadd});

  final SongsController songsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "${filteredsongs.length} $texttoadd",
            style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          PopupMenuButton(
              onSelected: (value) {
                songsController.selectedFilter.value = value;

                log(value.toString());
              },
              iconSize: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              offset: Offset(0, 40.h),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: SongSortType.TITLE,
                    child: Row(
                      children: [
                        Text(
                          SongSortType.TITLE.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        songsController.selectedFilter.value ==
                                SongSortType.TITLE
                            ? Icon(
                                FlutterRemix.radio_button_fill,
                                color: Appcolors.orangeColor,
                              )
                            : Icon(
                                FlutterRemix.checkbox_blank_circle_line,
                                color: Appcolors.orangeColor,
                              )
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: SongSortType.ALBUM,
                    child: Row(
                      children: [
                        Text(
                          SongSortType.ALBUM.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        songsController.selectedFilter.value ==
                                SongSortType.ALBUM
                            ? Icon(
                                FlutterRemix.radio_button_fill,
                                color: Appcolors.orangeColor,
                              )
                            : Icon(
                                FlutterRemix.checkbox_blank_circle_line,
                                color: Appcolors.orangeColor,
                              )
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: SongSortType.ARTIST,
                    child: Row(
                      children: [
                        Text(
                          SongSortType.ARTIST.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        songsController.selectedFilter.value ==
                                SongSortType.ARTIST
                            ? Icon(
                                FlutterRemix.radio_button_fill,
                                color: Appcolors.orangeColor,
                              )
                            : Icon(
                                FlutterRemix.checkbox_blank_circle_line,
                                color: Appcolors.orangeColor,
                              )
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: SongSortType.DISPLAY_NAME,
                    child: Row(
                      children: [
                        Text(
                          SongSortType.DISPLAY_NAME.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        songsController.selectedFilter.value ==
                                SongSortType.DISPLAY_NAME
                            ? Icon(
                                FlutterRemix.radio_button_fill,
                                color: Appcolors.orangeColor,
                              )
                            : Icon(
                                FlutterRemix.checkbox_blank_circle_line,
                                color: Appcolors.orangeColor,
                              )
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: SongSortType.DATE_ADDED,
                    child: Row(
                      children: [
                        Text(
                          SongSortType.DATE_ADDED.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        songsController.selectedFilter.value ==
                                SongSortType.DATE_ADDED
                            ? Icon(
                                FlutterRemix.radio_button_fill,
                                color: Appcolors.orangeColor,
                              )
                            : Icon(
                                FlutterRemix.checkbox_blank_circle_line,
                                color: Appcolors.orangeColor,
                              )
                      ],
                    ),
                  ),
                ];
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Obx(() => Text(
                        songsController.selectedFilter.value.name
                            .toCapitalize()!,
                        style: TextStyle(
                          color: Appcolors.orangeColor,
                          fontSize: 12.sp,
                        ),
                        overflow: TextOverflow.clip,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    FlutterRemix.arrow_up_down_fill,
                    color: Appcolors.orangeColor,
                    size: 18,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
