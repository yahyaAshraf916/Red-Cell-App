import 'package:flutter/material.dart';

import 'donation_screen.dart';

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  List<Gender> genders = <Gender>[];

  @override
  void initState() {
    super.initState();
    genders.add(Gender("Blood", "assets/images/blood-type (1).png", false));
    genders.add(Gender("Plasma", "assets/images/plasma_image.png", false));
    genders.add(Gender("Platelets", "assets/images/platelets_image.png", false));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: genders.length,
        itemBuilder: (context, index) {
          return InkWell(
            //splashColor: Colors.pinkAccent,
            onTap: () {
              setState(() {
                genders.forEach((gender) => gender.isSelected = false);
                genders[index].isSelected = true;
              });
            },
            child: CustomRadio(genders[index]),
          );
        });
  }

}
class CustomRadio extends StatelessWidget {
  final Gender _gender;

  const CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 27),
      margin: EdgeInsets.all( 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _gender.isSelected ? Color(0xffd6666e) : Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            _gender.image,
            height: 50,
            width: 50,
          ),
          Text(_gender.name),
        ],
      ),

    );
  }
}
/*
Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RequestType(
                            requestType: "Blood",
                            imgRequestType: "assets/images/blood-type (1).png",
                            index: 0),
                        RequestType(
                          requestType: "Plasma",
                          imgRequestType: "assets/images/plasma_image.png",
                          index: 1,
                        ),
                        RequestType(
                          requestType: "Platelets",
                          imgRequestType: "assets/images/platelets_image.png",
                          index: 2,
                        )
                      ],
                    ),

                     Card(
        color: _gender.isSelected ? Color(0xFF3B4257) : Colors.white,
        child: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          margin: new EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                _gender.image ,
                color: _gender.isSelected ? Colors.white : Colors.grey,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                _gender.name,
                style: TextStyle(
                    color: _gender.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ))
 */