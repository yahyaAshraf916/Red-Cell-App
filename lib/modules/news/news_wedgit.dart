import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../api/module/news_response.dart';

class NewWidget extends StatelessWidget {
  Articles article;

  NewWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 7,
            ),
          ]),
      padding: EdgeInsets.only(left: 20, top: 0, right: 10, bottom: 8),
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.source!.name!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xff0A0819),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 18,
                        color: Color(0xff888C8D),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        formatDateNews(article),
                        style: TextStyle(
                          color: Color(0xff888C8D),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: Color(0xff888C8D),
                      ),
                      Text(
                        "Egypt",
                        style: TextStyle(
                          color: Color(0xff888C8D),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          if (article.urlToImage != null)
            InkWell(
                onTap: () {
                  _launchURL(Uri.parse(article.url ?? ""));
                },
                child: Image(image: NetworkImage(article.urlToImage ?? ""))),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              _launchURL(Uri.parse(article.url ?? ""));
            },
            child: Text(article.description ?? "",
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 17.0, top: 5, right: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FavoriteButton(
                  valueChanged: (_) {},
                  iconSize: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.share_outlined,
                  color: Color(0xff76848B),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.insert_comment_outlined, color: Color(0xff76848B)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String formatDateNews(Articles article) {
  DateFormat input = DateFormat(article.publishedAt);
  DateFormat output = DateFormat('hh:mm a');

  DateTime inputDate = input.parse(article.publishedAt ?? "");
  String outputDate = output.format(inputDate);
  return outputDate;
}

_launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
