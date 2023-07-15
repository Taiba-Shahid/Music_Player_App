import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/screens/home_screen/components/Album_screen/album_view.dart';
import 'package:music_app/screens/home_screen/components/songs_screen/songs_view.dart';
import 'package:music_app/screens/home_screen/components/suggested_view.dart';
import 'package:music_app/utils/colors.dart';
import 'package:music_app/utils/text.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  bool _hasPermission = false;
  @override
  void initState() {
    super.initState();

    LogConfig logConfig = LogConfig(logType: LogType.DEBUG);
    _audioQuery.setLogConfig(logConfig);

    checkAndRequestPermissions();
  }

  checkAndRequestPermissions({bool retry = false}) async {
    _hasPermission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );

    _hasPermission ? setState(() {}) : null;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Appcolors.backgroundColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FlutterRemix.search_2_fill,
                size: 25,
              ),
              iconSize: 30,
              color: Colors.blueGrey,
            )
          ],
          title: Row(
            children: [
              Container(
                height: 30.h,
                width: 30.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Image(
                  image: AssetImage("assets/images/image-removebg-preview.png"),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              const Text(
                "Mume",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
        backgroundColor: Appcolors.backgroundColor,
        body: Column(children: [
          TabBar(
            indicatorColor: Appcolors.orangeColor,
            labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
            tabs: [
              Tab(
                child: Text(
                  "Suggested",
                  style: greytext,
                ),
              ),
              Tab(
                child: Text(
                  "Songs",
                  style: greytext,
                ),
              ),
              Tab(
                child: Text(
                  "Artists",
                  style: greytext,
                ),
              ),
              Tab(
                child: Text(
                  "Albums",
                  style: greytext,
                ),
              ),
              Tab(
                child: Text(
                  "Favourite",
                  style: greytext,
                ),
              ),
            ],
          ),
          !_hasPermission
              ? const Text("No Permission")
              : Expanded(
                  child: TabBarView(children: [
                    const SuggestedView(),
                    SongsView(),
                    const Center(
                      child: Text(
                        "Artist Tab",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    const AlbumView(),
                    const Center(
                      child: Text(
                        "Favourite Tab",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ]),
                )
        ]),
      ),
    );
  }
}
