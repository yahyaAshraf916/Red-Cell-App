import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../api/module/news_response.dart';
import 'news_wedgit.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            size: 25,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.clear,
          size: 25,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews2(keywordSearch: query ??" "),
        builder:(context, snapShot){
          if(snapShot.hasError){
            return Text(snapShot.error.toString());
          }else if(snapShot.hasData){
            return ListView.builder(
                itemCount: snapShot.data!.articles!.length,
                itemBuilder: (context,index){
                  return NewWidget(snapShot.data!.articles![index]);
                });
          }else{
            return  Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(),
        builder:(context, snapShot){
          if(snapShot.hasError){
            return Text(snapShot.error.toString());
          }else if(snapShot.hasData){

            return ListView.builder(
                itemCount: snapShot.data!.articles!.length,
                itemBuilder: (context,index){
                  return NewWidget(snapShot.data!.articles![index]);
                });
          }else{
            return  Center(child: CircularProgressIndicator());
          }
        });
  }
}
