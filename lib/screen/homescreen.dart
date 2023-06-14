import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/widgets/toprated.dart';
import 'package:movies/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widgets/trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <dynamic> trendingmovies = [];
  List <dynamic> topratedmovies =[];
  List <dynamic> toptv=[];
  final String apikey ='fe94827102569f5d9a93ed5c0f6d41b8';
  final String readaccesstoken ='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZTk0ODI3MTAyNTY5ZjVkOWE5M2VkNWMwZjZkNDFiOCIsInN1YiI6IjY0ODZlYzU3OTkyNTljMDExYzQxMzg0YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-MO4uZwW2cmczWzChWG4mWHb7u3jhv0XusSoXXEK0aw';

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey,readaccesstoken),
    logConfig: ConfigLogger(
      showLogs:true,
      showErrorLogs: true
    ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedmoviesresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map toptvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    print(toptvresult);

    setState(() {
      trendingmovies =trendingresult['results'];
      topratedmovies =topratedmoviesresult['results'];
      toptv =toptvresult['results'];
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY MOVIES'),
      ),

      body: ListView(
        children:[
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
          TV(tv: toptv)
            ],
      ),
    );
  }
}
