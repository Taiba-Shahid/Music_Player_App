import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/screens/home_screen/components/artist_screen/filters_section.dart';
import 'package:music_app/utils/text.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../controllers/artists_controller.dart';

class ArtistView extends StatelessWidget {
  ArtistView({super.key});

  final ArtistController artistController = Get.put(ArtistController());

  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Obx(
      () => FutureBuilder<List<ArtistModel>>(
          future: _audioQuery.queryArtists(
              sortType: artistController.selectedFilter.value),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text(
                "Fault in fetcch Artists",
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              );
            }
            List<ArtistModel> filteredArtists = snapshot.data!
                .where((element) => element.artist.isNotEmpty)
                .toList();
            return Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: FilterSectionArtist(
                      filteredArtist: filteredArtists,
                      texttoadd: "Artists",
                    )),
                const Divider(
                  indent: 10.0,
                  endIndent: 10.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredArtists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/images (2).jpg")),
                              borderRadius: BorderRadius.circular(5)),
                          height: 50.h,
                          width: 50.w,
                        ),
                        title: Text(
                          filteredArtists[index].artist,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(
                          FlutterRemix.more_2_fill,
                          size: 20,
                        ),
                        subtitle: IntrinsicHeight(
                          child: Row(
                            children: [
                              Text(
                                  "${filteredArtists[index].numberOfAlbums} Albums",
                                  style: greytext.copyWith(fontSize: 11.sp)),
                              const VerticalDivider(
                                thickness: 2,
                              ),
                              Text(
                                  "${filteredArtists[index].numberOfTracks} Songs",
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
