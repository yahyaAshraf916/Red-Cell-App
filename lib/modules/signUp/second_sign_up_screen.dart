import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:red_cell_app/modules/home/home_screen.dart';
import 'package:red_cell_app/modules/login/login.dart';
import 'package:red_cell_app/modules/page_view/main.dart';

class second_sign_up_screen extends StatefulWidget {
  String username;
  String email;
  String password;

  second_sign_up_screen(
      {required this.username, required this.email, required this.password});

  @override
  State<second_sign_up_screen> createState() => _second_sign_up_screenState();
}

class _second_sign_up_screenState extends State<second_sign_up_screen> {
  var user ;
  getdata() async {
    user= await FirebaseAuth.instance.currentUser;
    CollectionReference users =
        FirebaseFirestore.instance.collection('user_information');
    users.add({
      'username': "${widget.username}", // John Doe
      'email': "${widget.email}", // Stokes and Sons
      'password': "${widget.password}",
      'years': con1.text,
      "manth": con2.text,
      "days": con2.text,
      "city": "${city}",
      "phone": con4.text,
      "gender": "${gender}"
    });
    print(users);
  }

  var con1 = TextEditingController();
  var con2 = TextEditingController();
  var con3 = TextEditingController();
  var con4 = TextEditingController();
  late String gender;
  String result = '';
  late String city;
  Color redcolor = Color.fromARGB(1000, 226, 78, 90);

  Color whitecolor = Colors.white;
  late Color color = Colors.white;
  late Color malet = Color.fromARGB(1000, 226, 78, 90);
  late Color maleback = Colors.white;
  late Color frmalet = Color.fromARGB(1000, 226, 78, 90);
  late Color femaleback = Colors.white;
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;

  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    print(widget.username);
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: ListView(
            children: [
              lableoftextfaild("date of birth"),
              Row(
                children: [
                  Expanded(
                      child: textfaild(
                          "years", TextInputType.number, false, con1)),
                  Expanded(
                      child: textfaild(
                          "manths", TextInputType.number, false, con2)),
                  Expanded(
                      child:
                          textfaild("days", TextInputType.number, false, con3)),
                ],
              ),
              /////////////////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////////////////
              ///////////////////////////////////////////////////////////////////////////////////////////
              lableoftextfaild("choose your country"),
              Container(
                padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
                margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
                child: DropDownTextField(
                  dropdownRadius: 10,
                  textFieldDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  // initialValue: "name4",
                  controller: _cnt,
                  clearOption: true,
                  //enableSearch: true,
                  // dropdownColor: Colors.green,
                  searchDecoration: const InputDecoration(),
                  validator: (value) {
                    if (value == null) {
                      return "Required field";
                    } else {
                      print(value);
                      return null;
                    }
                  },
                  dropDownItemCount: 6,

                  dropDownList: const [
                    DropDownValueModel(name: 'Cairo	القاهرة', value: "Cairo"),
                    DropDownValueModel(
                        name: 'Alexandria	الإسكندريه', value: "Alexandria"),
                    DropDownValueModel(name: 'Gizeh	الجيزة', value: "Gizeh"),
                    DropDownValueModel(
                        name: 'Shubra El-Kheima	شبرا الخيمة',
                        value: "Shubra El-Kheima"),
                    DropDownValueModel(
                        name: 'Port Said	بور سعيد', value: "Port Said"),
                    DropDownValueModel(name: '	Suez	السويس', value: "	Suez"),
                    DropDownValueModel(name: 'Luxor	الأقصر', value: "Luxor"),
                    DropDownValueModel(
                        name: 'al-Mansura	المنصورة', value: "al-Mansura"),
                    DropDownValueModel(name: 'Tanta	طنطا', value: "Tanta"),
                    DropDownValueModel(
                        name: '	Damanhur	دمنهور', value: "	Damanhur"),
                    DropDownValueModel(
                        name: 'al-Minya	المنيا', value: "al-Minya"),
                    DropDownValueModel(
                        name: 'Hurghada	الغردقة', value: "Hurghada"),
                    DropDownValueModel(
                        name: 'Shibin El Kom	شبين الكوم',
                        value: "Shibin El Kom"),
                    DropDownValueModel(name: 'Banha	بنها', value: "Banha	"),
                    DropDownValueModel(
                        name: 'Kafr el-Sheikh	كفر الشيخ',
                        value: "Kafr el-Sheikh"),
                    DropDownValueModel(
                        name: 'Marsa Matruh	مرسي مطروح', value: "Marsa Matruh"),
                  ],
                  onChanged: (val) {
                    setState(() {
                      city = val.value;
                    });
                    print(city);
                    print("city");
                  },
                ),
              ),
              ////////////////////////////////////////////////////////////////////////////////////////////
              ///////////////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////////////////
              lableoftextfaild("phone number"),
              textfaild("+02 |", TextInputType.phone, false, con4),
              ////////////////////////////////////////////////////////////////////////////////////////////
              ///////////////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////////////////
              lableoftextfaild("choose your gender"),
              Container(
                padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
                margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          maleback = Color.fromARGB(1000, 226, 78, 90);
                          malet = Colors.white;
                          femaleback = Colors.white;
                          frmalet = Color.fromARGB(1000, 226, 78, 90);
                          gender = "Male";
                        });
                      },
                      child: Text("male",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: malet)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                        shadowColor: MaterialStateProperty.all(Colors.grey),
                        backgroundColor: MaterialStateProperty.all(maleback),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          malet = Color.fromARGB(1000, 226, 78, 90);
                          maleback = Colors.white;
                          frmalet = Colors.white;
                          femaleback = Color.fromARGB(1000, 226, 78, 90);
                          gender = "Female";
                        });
                      },
                      child: Text("Female",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: frmalet)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                        shadowColor: MaterialStateProperty.all(Colors.grey),
                        backgroundColor: MaterialStateProperty.all(femaleback),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text("${result}",
                    style: TextStyle(color: Color.fromARGB(1000, 226, 78, 90))),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                  height: 70,
                  padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
                  margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
                  child: conferm_botton()),
            ],
          )),
    );
  }

  Container textfaild(String hint, TextInputType ty, bool visabletext,
      TextEditingController c) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
      margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
      child: TextField(
        controller: c,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        keyboardType: ty,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: '${hint}',
        ),
        obscureText: visabletext,
      ),
    );
  }

  Container lableoftextfaild(String name) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
      margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
      child: Text(
        "${name}",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  ElevatedButton conferm_botton() {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(1000, 226, 78, 90))),
        onPressed: () async {
          if (int.parse(con1.text) > 1923 && int.parse(con1.text) < 2023) {
            if (int.parse(con2.text) > 1 && int.parse(con2.text) < 12) {
              if (int.parse(con3.text) > 1 && int.parse(con3.text) < 31) {
                if ((con4.text).contains("010", 0) ||
                    (con4.text).contains("011", 0) ||
                    (con4.text).contains("012", 0) ||
                    (con4.text).contains("015",0)
                ) {

                  getdata();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login(),));
                  setState(() {
                    result = '';
                  });
                }
                else{
                  setState(() {
                    result ="enter valid phone number";
                  });
                }
              } else {
                setState(() {
                  result = "days betwean 1 and 31";
                });
              }
            } else {
              setState(() {
                result = "manth betwean 1 and 12";
              });
              ;
            }
          } else {
            setState(() {
              result = "year betwean 1923 and 2023";
            });
          }
        },
        child: Text(
          "continue",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
