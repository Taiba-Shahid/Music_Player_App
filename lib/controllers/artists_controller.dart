import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ArtistController extends GetxController {
  Rx<ArtistSortType> selectedFilter= ArtistSortType.ARTIST.obs;
}
