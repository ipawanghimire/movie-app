import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description,bannerurl,posterurl,vote,launch_date;
  const Description({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                  height: 250,
                width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                    
              ),),
                  Positioned(bottom: 10,
                      child: Text("  ✩ "+vote)),

                ]
              ),
            ),
            SizedBox(height: 16,),
            Container(padding: EdgeInsets.all(10),
            child: Text(name!=null?name:'Coming Soon',style: TextStyle(
              fontSize: 24,
            ),),
            ),
            Container(padding: EdgeInsets.only(left: 10),
            child: Text('Release date : '+launch_date,style: TextStyle(
              fontSize: 16,
            ),)),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(child: Text('Description : '+description),

                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
