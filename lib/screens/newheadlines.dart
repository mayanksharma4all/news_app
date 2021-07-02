import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/utils/server.dart';

class NewsHeadlines extends StatefulWidget {
  @override
  _NewsHeadlinesState createState() => _NewsHeadlinesState();
}

class _NewsHeadlinesState extends State<NewsHeadlines> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Server Call");
    // Future<Response> future = Server.getHeadLines();
    // future
    //     .then((response) => print("Res Data ${response.data['articles']}"))
    //     .catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    print("Build Call");
    return Scaffold(
      appBar: AppBar(
        title: Text('HeadLines'),
      ),
      body: Container(
        child: FutureBuilder(
          future: Server.getHeadLines(),
          builder: (BuildContext context,
              AsyncSnapshot<Response<dynamic>> snapShot) {
            if (snapShot.hasData == true &&
                snapShot.connectionState == ConnectionState.done) {
              print("Snap Shot State is  ${snapShot.connectionState}");
              //snapShot.data.he
              print(snapShot.data.data['articles']); //
              dynamic articles = snapShot.data.data['articles'];
              print("Articles " + articles.length.toString());
              // return Text('News');
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (BuildContext btx, int index) {
                  return Card(
                    elevation: 5,

                    margin: EdgeInsets.all(5),
                    child: ListTile(

                      subtitle: Text(articles[index]['title']),
                      title: articles[index]['urlToImage'] == null
                          ? Text('No Image')
                          : Container(
                              //margin: EdgeInsets.all(10),
                              //padding: EdgeInsets.all(5),
                              child: Image.network(
                                articles[index]['urlToImage'],
                                fit: BoxFit.fill,
                              ),
                            ),
                    ),
                  );
                },
              );
            } else if (snapShot.hasError) {
              return Center(
                child: Text(
                  'Some Error Occur ',
                  style: TextStyle(fontSize: 40),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'Loading....',
                  style: TextStyle(fontSize: 40),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
