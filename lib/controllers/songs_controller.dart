import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsController extends GetxController{
   Rx<SongSortType>  selectedFilter = SongSortType.TITLE.obs;
}