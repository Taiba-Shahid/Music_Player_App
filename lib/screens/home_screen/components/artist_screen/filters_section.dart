import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/helpers/capitalize_first.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../../utils/colors.dart';
import '../../../../controllers/artists_controller.dart';

class FilterSectionArtist extends StatelessWidget {
  final List<ArtistModel> filteredArtist;
  final String texttoadd;

  const FilterSectionArtist(
      {super.key, required this.texttoadd, required this.filteredArtist});

  @override
  Widget build(BuildContext context) {
    final ArtistController artistController = Get.find();
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 5, bottom: 5),
      child: Row(
        children: [
          Text(
            "${filteredArtist.length} $texttoadd",
            style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          PopupMenuButton(
              onSelected: (value) {
                artistController.selectedFilter.value = value;

                log(value.toString());
              },
              iconSize: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              offset: Offset(0, 40.h),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: ArtistSortType.ARTIST,
                    child: Row(
                      children: [
                        Text(
                          ArtistSortType.ARTIST.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        artistController.selectedFilter.value ==
                                ArtistSortType.ARTIST
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
                    value: ArtistSortType.ARTIST,
                    child: Row(
                      children: [
                        Text(
                          ArtistSortType.ARTIST.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        artistController.selectedFilter.value ==
                                ArtistSortType.ARTIST
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
                    value: ArtistSortType.NUM_OF_ALBUMS,
                    child: Row(
                      children: [
                        Text(
                          ArtistSortType.NUM_OF_ALBUMS.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        artistController.selectedFilter.value ==
                                ArtistSortType.NUM_OF_ALBUMS
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
                        artistController.selectedFilter.value.name
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
