import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'news.dart';

void main() {
  runApp(
      MaterialApp(
        title:"Social Albania",
        home: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  List <news> currentNews=[
    news("Higher education crisis", "Higher education still is suffering from remote studying.", 15, 12),
    news("Local Businesses automation", "E-Commerce is getting more attention.", 36, 12),
    news("Heavy traffic at Tirana's entry point", "Construction of Shqiponja Square set to finish on early 2022.", 42, 50),
    news("Upcoming elections problems", "Violent conflicts in the streets .", 25, 33),
    news("Higher education crisis", "Higher education still is suffering from remote studying.", 15, 12),
    news("Local Businesses automation", "E-Commerce is getting more attention.", 36, 12),
    news("Heavy traffic at Tirana's entry point", "Construction of Shqiponja Square set to finish on early 2022.", 42, 50),
    news("Upcoming elections problems", "Violent conflicts in the streets .", 25, 33),
    news("Higher education crisis", "Higher education still is suffering from remote studying.", 15, 12),
    news("Local Businesses automation", "E-Commerce is getting more attention.", 36, 12),
    news("Heavy traffic at Tirana's entry point", "Construction of Shqiponja Square set to finish on early 2022.", 42, 50),
    news("Upcoming elections problems", "Violent conflicts in the streets .", 25, 33)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Social Albania"))),
        body: Padding(
          padding:  EdgeInsets.all(3.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                      children: [
                        for(var i in currentNews) showNews(context, i)
                        ],
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>addingNewsPage()));
                    }),
              )
            ],
          ),
        ),
    );
  }

  Container showNews(BuildContext context,news currentNews){

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(currentNews.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(children: [
                LikeButton(
                  likeCount: currentNews.likes,
                ),
              ],),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                        Icons.add_comment,
                    ),
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>descriptionPage(currentNews)));
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class descriptionPage extends StatelessWidget{
  news mainNews;

  descriptionPage(news mainNews){
    this.mainNews=mainNews;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(title: Center(child: Text(mainNews.title))),
          body: Text(mainNews.description),
      );
  }
}

class addingNewsPage extends StatelessWidget{
  news mainNews;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add an article"))),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Enter the title of the article."
            ),
            onSubmitted: (val1){

            },
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Enter the title of the article."
            ),
            onSubmitted: (val1){

            },
          ),
        ],
      ),
    );
  }
}
