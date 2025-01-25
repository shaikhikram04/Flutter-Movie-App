import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/utils/modified_text.dart';
import 'package:movie_app/widgets/top_rated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _trendingMovies = [];
  List _topRatedMovies = [];
  List _tvShow = [];
  final String _apiKey = dotenv.get('API_Key');
  final String _apiReadAccessToken = dotenv.get('API_Read_Access_Token');

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    TMDB tmdbWithCustomLog = TMDB(ApiKeys(_apiKey, _apiReadAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCustomLog.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLog.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLog.v3.tv.getPopular();
    setState(() {
      _trendingMovies = trendingResult['results'];
      _topRatedMovies = topRatedResult['results'];
      _tvShow = tvResult['results'];
    });
    debugPrint('Trending: $_trendingMovies');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ModifiedText(
          text: 'Flutter Movie App',
          color: Colors.white,
          fontSize: 21,
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: ListView(
        children: [
          TrendingMovies(trending: _trendingMovies),
          TopRatedMovies(topRated: _topRatedMovies),
        ],
      ),
    );
  }
}
