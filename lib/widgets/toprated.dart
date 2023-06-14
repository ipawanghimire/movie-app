import 'package:flutter/material.dart';

import '../screen/description.dart';
class TopRated extends StatelessWidget {
  final List <dynamic> toprated;

  const TopRated({ required this.toprated}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Rated Movies',),
          SizedBox(height: 10,),
          Container(height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:toprated.length, itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (contex)=>Description(
                    name: toprated[index]["title"],
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                    posterurl: 'https://image.tmdb.org/t/p/w500'+toprated [index]['poster_path'],
                    description: toprated[index]['overview'],
                    vote: toprated[index]['vote_average'].toString(),
                    launch_date: toprated[index]['release_date'],
                  )));
                },
                child: toprated[index]['title'] != null?Card(
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
                                      'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                  )
                              )
                          ),
                        ),
                        Container(padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(toprated[index]['title'] != null
                        ? toprated[index]['title']
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
