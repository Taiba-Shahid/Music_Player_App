import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/albums_controller.dart';
import 'package:music_app/helpers/capitalize_first.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../../utils/colors.dart';

class FilterSectionAlbum extends StatelessWidget {
  final List<AlbumModel> filteredAlbum;
  final String texttoadd;

  const FilterSectionAlbum(
      {super.key, required this.texttoadd, required this.filteredAlbum});

  @override
  Widget build(BuildContext context) {
    final AlbumController albumController = Get.find();
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 5, bottom: 5),
      child: Row(
        children: [
          Text(
            "${filteredAlbum.length} $texttoadd",
            style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          PopupMenuButton(
              onSelected: (value) {
                albumController.selectedFilter.value = value;

                log(value.toString());
              },
              iconSize: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              offset: Offset(0, 40.h),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: AlbumSortType.ALBUM,
                    child: Row(
                      children: [
                        Text(
                          AlbumSortType.ALBUM.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        albumController.selectedFilter.value ==
                                AlbumSortType.ALBUM
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
                    value: AlbumSortType.ARTIST,
                    child: Row(
                      children: [
                        Text(
                          AlbumSortType.ARTIST.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        albumController.selectedFilter.value ==
                                AlbumSortType.ARTIST
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
                    value: AlbumSortType.NUM_OF_SONGS,
                    child: Row(
                      children: [
                        Text(
                          AlbumSortType.NUM_OF_SONGS.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        albumController.selectedFilter.value ==
                                AlbumSortType.NUM_OF_SONGS
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
                        albumController.selectedFilter.value.name
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
