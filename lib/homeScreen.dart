import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:edu_app/courcseScreen.dart';
import 'package:edu_app/provider/courseProvider.dart';
import 'package:edu_app/widget/categoryType.dart';
import 'package:edu_app/widget/courseWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool isSelect = false;
  var subject;
  var userData;
  getSubData() async {
    Provider.of<CourseProvider>(context, listen: false)
        .getCourse()
        .then((value) {
      print("-----------");

      var data = jsonDecode(value);
      print(data);
      setState(() {
        userData = data["data"]["userdata"];
        subject = data["data"]["subjects"];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Color.fromARGB(255, 246, 246, 255),
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 30,
            color: Color(0xFF482a71),
          ),
          SizedBox(
              height: 40,
              width: 40,
              child: Image(image: AssetImage("assets/images/trophy.jpg"))),
          Icon(Icons.book_sharp, size: 30, color: Color(0xFF482a71)),
        ],
        onTap: (index) {
          //Handle button tap
          getSubData();
          print(index);
          if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CourceScreen()));
          }
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 246, 246, 255),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .25,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 110, 66, 173),
                      Theme.of(context).primaryColor
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .1,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hi Good Morning !",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    userData["first_name"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                              Container(
                                width: MediaQuery.of(context).size.width * .3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .15,
                                      decoration: ShapeDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        shape: StadiumBorder(),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "10",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 202, 88),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image(
                                                  height: 20,
                                                  image: AssetImage(
                                                      "assets/images/coin.png")),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 26,
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                            NetworkImage(userData["image"]),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * .07,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFf2e8f5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Selected Cource",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 144, 126, 151)),
                                      ),
                                      Text(
                                        "Montessori",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  )),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Change",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.compare_arrows,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .15,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryType(
                      image: 'assets/images/exam.png',
                      color1: Color.fromARGB(255, 241, 138, 159),
                      color2: Color(0xFFe75d7d),
                      label: "Exam",
                    ),
                    CategoryType(
                      image: 'assets/images/note.png',
                      color1: Color(0xFFf3b847),
                      color2: Color(0xFFf5ab38),
                      label: "Practice",
                    ),
                    CategoryType(
                      image: 'assets/images/school-material.png',
                      color1: Color(0xFF66c2da),
                      color2: Color(0xFF51bcd7),
                      label: "Materials",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 27, 27, 27)),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              GridView.count(
                mainAxisSpacing: 10,
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: .9,
                children: List.generate(listitems.length, (index) {
                  return CourceWidget(
                    itemName: listitems[index]["itemName"].toString(),
                    color1: listitems[index]["color1"],
                    color2: listitems[index]["color2"],
                    image: listitems[index]["image"],
                  );
                }),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .25,
                width: double.infinity,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFf2edd2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: Text(
                                    "Practice With Previous Year Question Papers",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: const Color.fromARGB(
                                            255, 27, 27, 27)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: Image(
                            width: 150,
                            image: AssetImage("assets/images/stdent.png"))),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }

  List listitems = [
    {
      "itemName": 'KTET',
      "color1": Color.fromARGB(255, 244, 224, 197),
      "color2": Color.fromARGB(255, 236, 194, 55),
      "image": "assets/images/ktet.png"
    },
    {
      "itemName": 'LP/UP/HS',
      "color1": Color.fromARGB(255, 183, 234, 235),
      "color2": Color(0xFF2fcecb),
      "image": "assets/images/teach.jpg"
    },
    {
      "itemName": 'SET',
      "color1": Color.fromARGB(255, 237, 202, 148),
      "color2": Color(0xFFe49f4b),
      "image": "assets/images/certificate_2020599.png"
    },
    {
      "itemName": 'NET',
      "color1": Color.fromARGB(255, 248, 230, 165),
      "color2": Color(0xFFfe989a),
      "image": "assets/images/uni.png"
    },
    {
      "itemName": 'Montessori',
      "color1": Color.fromARGB(255, 174, 178, 255),
      "color2": Color(0xFFa477fd),
      "image": "assets/images/5836.jpg"
    },
    {
      "itemName": 'CRASH COURCE',
      "color1": Color.fromARGB(255, 255, 164, 158),
      "color2": Color(0xFFfa288e),
      "image": "assets/images/certificate_2020599.png"
    },
  ];
}
