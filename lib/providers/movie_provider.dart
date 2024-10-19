import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_api/tmdb_api.dart';

final movieProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final String apiKey = 'd02fec62b5289599f096f360a2c6fe44';
  final String readAccessToken = 'YOUR_READ_ACCESS_TOKEN_HERE';

  TMDB tmdbWithCustomLogs = TMDB(
    ApiKeys(apiKey, readAccessToken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ),
  );

  Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
  Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
  Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

  return {
    'trending': trendingResult['results'],
    'topRated': topRatedResult['results'],
    'tv': tvResult['results'],
  };
});
