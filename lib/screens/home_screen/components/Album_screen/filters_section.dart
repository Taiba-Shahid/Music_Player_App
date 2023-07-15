import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              offset: Offset(0, 40.h),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text(
                          SongSortType.TITLE.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        Icon(
                          FlutterRemix.radio_button_line,
                          color: Appcolors.orangeColor,
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text(
                          SongSortType.ALBUM.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        Icon(
                          FlutterRemix.radio_button_line,
                          color: Appcolors.orangeColor,
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text(
                          SongSortType.ARTIST.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        Icon(
                          FlutterRemix.radio_button_line,
                          color: Appcolors.orangeColor,
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text(
                          SongSortType.DISPLAY_NAME.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        Icon(
                          FlutterRemix.radio_button_line,
                          color: Appcolors.orangeColor,
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text(
                          SongSortType.DATE_ADDED.name.toCapitalize()!,
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        const Spacer(),
                        Icon(
                          FlutterRemix.radio_button_line,
                          color: Appcolors.orangeColor,
                        )
                      ],
                    ),
                  ),
                ];
              })
        ],
      ),
    );
  }
}
