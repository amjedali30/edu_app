import 'dart:convert';

import 'package:edu_app/provider/courseProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CourceScreen extends StatefulWidget {
  const CourceScreen({super.key});

  @override
  State<CourceScreen> createState() => _CourceScreenState();
}

class _CourceScreenState extends State<CourceScreen> {
  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;

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
        subjects = data["data"]["subjects"];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime.now();
    getSubData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .26,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .18,
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
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .1,
                  width: double.infinity,
                  child: SafeArea(
                      child: AppBar(
                    backgroundColor: Colors.transparent,
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    centerTitle: true,
                    title: Text(
                      "Course",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: MediaQuery.of(context).size.height * .15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              child: Row(
                                children: List.generate(
                                  lastDayOfMonth.day,
                                  (index) {
                                    final currentDate = lastDayOfMonth
                                        .add(Duration(days: index + 1));
                                    final dayName =
                                        DateFormat('E').format(currentDate);
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: index == 0 ? 16.0 : 0.0,
                                          right: 16.0),
                                      child: GestureDetector(
                                        onTap: () => setState(() {
                                          selectedIndex = index;
                                        }),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 213, 204, 250),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Day",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8.0),
                                                    Text(
                                                      "${index + 1}",
                                                      style: const TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8.0),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              height: 10.0,
                                              width: 28.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: selectedIndex == index
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : const Color.fromARGB(
                                                        0, 255, 255, 255),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: MediaQuery.of(context).size.height * .13,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFf2edd2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          "Upgrade and unlock the full course",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 182, 36, 25),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Upgarde",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: MediaQuery.of(context).size.height * .13,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 242, 210),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Whatsapp ലെ സഹായത്തിനായി",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Theme.of(context).primaryColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "80456784567",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Theme.of(context).primaryColor),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 9, 108, 17),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.whatsapp,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Whatsapp",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final subject = subjects[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Container(
                      width: 100,
                      child: Image.network(
                        subject['icon'],
                        fit: BoxFit.fill,
                      )),
                  title: Text(subject['title']),
                  subtitle: Text('Level: ${subject['level_id']}'),
                  trailing: subject['free'] == 'on'
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.lock, color: Colors.red),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  List subjects = [];
}
