import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/albums_controller.dart';
import 'package:music_app/screens/home_screen/components/Album_screen/filters_section.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../utils/text.dart';

class AlbumView extends StatelessWidget {
  AlbumView({super.key});

  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    final AlbumController albumController = Get.put(AlbumController());
    return Obx(
      () => FutureBuilder<List<AlbumModel>>(
        future: _audioQuery.queryAlbums(
            sortType: albumController.selectedFilter.value),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text(
              "Fault in fetcch Albums",
              style: TextStyle(fontSize: 18.sp, color: Colors.black),
            );
          }
          List<AlbumModel> filteredAlbum = snapshot.data!
              .where((element) => element.album.isNotEmpty)
              .toList();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: FilterSectionAlbum(
                    texttoadd: "Albums", filteredAlbum: filteredAlbum),
              ),
              const Divider(
                indent: 10.0,
                endIndent: 10.0,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 0),
                  itemCount: filteredAlbum.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              child: Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/unnamed.png")),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              filteredAlbum[index].album,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Text(filteredAlbum[index].artist.toString(),
                                      style:
                                          greytext.copyWith(fontSize: 11.sp)),
                                  const VerticalDivider(
                                    thickness: 2,
                                  ),
                                  Text(
                                      "${filteredAlbum[index].numOfSongs}Songs",
                                      style:
                                          greytext.copyWith(fontSize: 11.sp)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
