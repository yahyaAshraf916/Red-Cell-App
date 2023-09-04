import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/module/news_response.dart';

class NewsWidget extends StatelessWidget {
  Articles article;

  NewsWidget(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    if (article.description != null&&article.urlToImage!=null) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 7,
              ),
            ]),
        padding: const EdgeInsets.only(left: 20, top: 0, right: 10, bottom: 8),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    article.author != null &&
                            !article.author!.contains("https://")
                        ? Text(
                            article.author!,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Color(0xff0A0819),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            "There is no article author",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff0A0819),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          size: 18,
                          color: Color(0xff888C8D),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          formatDateNews(article),
                          style: const TextStyle(
                            color: Color(0xff888C8D),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            
              
            
            InkWell(
              onTap: () {
                _launchURL(Uri.parse(article.url ?? ""));
              },
              child: 
              
              article.urlToImage != null
                  ? FancyShimmerImage(imageUrl: article.urlToImage!,errorWidget: Center(child: Text("empty")),)
                  : Container(),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                _launchURL(Uri.parse(article.url ?? ""));
              },
              child: article.description != null
                  ? Text(article.description!,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black))
                  : Container(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0, top: 5, right: 8, bottom: 8),
            ),
          ],
        ),
      );
    } else
      return Container() ;
  }
}

String formatDateNews(Articles article) {
  DateTime dt = DateTime.parse(article.publishedAt ?? "");

  final formattedDate = DateFormat('EEEE, MMM d, yyyy').format(dt);

  return formattedDate;
}

_launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
