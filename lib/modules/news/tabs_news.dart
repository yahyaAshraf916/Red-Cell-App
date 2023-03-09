import 'package:flutter/material.dart';
import 'package:red_cell_app/modules/news/news_wedgit.dart';
import '../../api/api_manager.dart';
import '../../api/module/news_response.dart';

class TabsNews extends StatefulWidget {
  @override
  State<TabsNews> createState() => _TabsNewsState();
}

class _TabsNewsState extends State<TabsNews> {
  List<Articles> newsList = [];
  final scrollController = ScrollController();
  bool showLoadNextPage = false;
  int pageNumber = 1;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          showLoadNextPage = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoadNextPage) {
      ApiManager.getNews(page: ++pageNumber).then((NewsResponse) {
        newsList.addAll(NewsResponse.articles ?? []);
        showLoadNextPage = false;
        setState(() {});
      });
    }
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          } else if (snapShot.hasData) {
            newsList = snapShot.data?.articles ?? [];

            return ListView.separated(
              controller: scrollController,
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return NewWidget(newsList[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 10,
                  color: Colors.transparent,
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
