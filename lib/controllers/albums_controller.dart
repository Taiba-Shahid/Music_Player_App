import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AlbumController extends GetxController {
  Rx<AlbumSortType> selectedFilter = AlbumSortType.ALBUM.obs;
}
