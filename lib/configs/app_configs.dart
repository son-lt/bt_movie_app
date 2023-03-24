import 'package:bt_movie_app/common/app_vectors.dart';

class AppConfigs {
  static const int listLength = 20;

  static const Map<String, String> listOptions = {
    'Genres': AppVectors.genresVector,
    'TV series': AppVectors.tvSeriesVector,
    'Movies': AppVectors.moviesVector,
    'In theatre': AppVectors.inTheatreVector,
  };

  static List<String> bottomNavigationBarVectorList = [
    AppVectors.homeVector,
    AppVectors.favoriteVector,
    AppVectors.ticketVector,
    AppVectors.accountVector,
    AppVectors.shuffleVector,
  ];
}
