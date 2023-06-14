import 'package:flutter/material.dart';

import '../screen/description.dart';
class TV extends StatelessWidget {
  final List tv;

  const TV({ required this.tv}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular TV Shows',),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:5, itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (contex)=>Description(
                    name: tv[index]["name"],
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                    posterurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                    description: tv[index]['overview']==null?tv[index]['overview']:'N/A',
                    vote: tv[index]['vote_average'].toString(),
                    launch_date: tv[index]['first_air_date'],
                  )));
                },
                child: tv[index]['name'] != null||tv[index]['backdrop_path']!=null? Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: EdgeInsets.all(8),
                          height: 140,
                          width:250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path']
                                  ),fit: BoxFit.cover
                              ),

                          ),
                        ),

                        Container(child: Text(tv[index]['name'] != null
                            ? tv[index]['name']
                            : 'Comming Soon'),)
                      ],
                    ),
                  ),
                ):Container()
              );
            }, )

            ,)

        ],
      ),
    );
  }
}
