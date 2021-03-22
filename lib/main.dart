import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Social Albania',
        home: Scaffold(
            appBar: AppBar(title: Center(child: Text("Social Albania"))),
            body: Column(

              children: [
                showNews("Higher education crisis", "Higher education still is suffering from remote studying.", 15, 12),

                showNews("Local Businesses automation", "E-Commerce is getting more attention.", 36, 12),
                showNews("Heavy traffic at Tirana's entry point", "Construction of Shqiponja Square set to finish on early 2022.", 42, 50),
                showNews("Upcoming elections problems", "Violent conflicts in the streets .", 25, 33),
              ],
            )));
  }

  Container showNews(String title, String text, int likes,int comments){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              Text(text,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(children: [
                LikeButton(),
                Text(likes.toString(),style: TextStyle(fontSize: 20),)
              ],),
              Row(
                children: [
                  Icon(Icons.add_comment),
                  Text(comments.toString(),style: TextStyle(fontSize: 20),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
