import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:red_cell_app/modules/signUp/signUp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class page_view extends StatefulWidget {
  @override
  State<page_view> createState() => _page_viewState();
}

class _page_viewState extends State<page_view> {
  List l = ["First", "scond", "therd"];
  List l1 = [
    "be a hero and save a life",
    "find the right donor",
    "track the donor"
  ];

  List l2 = [
    "be a hero and save a life track the donorbe a hero and save a life track the donor",
    "find the right donor be a hero ",
    "track the donor find the right do nor"
  ];

  List image = ['assets/1.png', 'assets/2.png', 'assets/3.png'];

  List backgroundimage = ['assets/11.png', 'assets/22.png', 'assets/33.png'];

  int switchpage = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageIndicatorContainer(
        align: IndicatorAlign.center,
        indicatorSpace: 10.0,
        length: l.length,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Colors.red,
        child: PageView(
          onPageChanged: (value) {
            setState(() {
              switchpage = value;
            });
          },
          children: l
              .map((e) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 300,
                child: Stack(
                  children: [
                    Center(
                      child: Image(
                          image: AssetImage(
                              backgroundimage[switchpage])),
                    ),
                    Center(
                      child:
                      Image(image: AssetImage(image[switchpage])),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 350,
                child: Column(children: [
                  Center(
                    child: Text("${l1[switchpage]}",
                        style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Text(
                        textAlign: TextAlign.center,
                        "${l2[switchpage]}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: ()async {
                            SharedPreferences pr = await SharedPreferences.getInstance();
                            pr.setInt("switch", 1);
                            print("yosef");
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => singUp(),));
                          },
                          child: Text(
                            "skip",
                            style: TextStyle(
                                color: Color.fromARGB(
                                    1000, 226, 78, 89)),
                          )),
                    ],
                  ),
                ]),
              ),
            ],
          ))
              .toList(),
        ),
      ),
    );
  }
}
