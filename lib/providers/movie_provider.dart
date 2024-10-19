import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_api/tmdb_api.dart';

final movieProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final String apiKey = 'd02fec62b5289599f096f360a2c6fe44';
  final String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMDJmZWM2MmI1Mjg5NTk5ZjA5NmYzNjBhMmM2ZmU0NCIsIm5iZiI6MTcyODg4NzMzMC42MDE2ODQsInN1YiI6IjY3MDdkNTFhMjAwYjUzODhiNTU2MzRkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2nxgp0P7V2YDMBoJBElHBTeZJfsDtsnys6sNBsrRxsA';

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
