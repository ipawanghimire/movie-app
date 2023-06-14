import 'package:flutter/material.dart';

import '../screen/description.dart';
class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({ required this.trending}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trending Movies',),
          SizedBox(height: 10,),
          Container(height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount:trending.length, itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>Description(
                      name: trending[index]["title"],
                        bannerurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                      posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                      description: trending[index]['overview'],
                      vote: trending[index]['vote_average'].toString(),
                      launch_date: trending[index]['release_date'],
                    )));
                  },
                  child: trending[index]['title'] != null?Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height:180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                                )
                              )
                            ),
                          ),
                          Container(padding: EdgeInsets.symmetric(horizontal: 8),
                            child:Text(trending[index]['title'] != null
                              ? trending[index]['title']
                              : 'Comming Soon'),)
                        ],
                      ),
                    ),
                  ):Container(),
                );
          }, )

            ,)

        ],
      ),
    );
  }
}
