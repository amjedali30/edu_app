import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CourseProvider with ChangeNotifier {
  String tocken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE5IiwidXNlcl9pZCI6IjE5Iiwicm9sZV9pZCI6IjIiLCJyb2xlX2xhYmVsIjoiVXNlciIsInBob25lIjoiOTk0NjgwMTEwMCJ9.D0tUEBGDi8gtc1vEK6GL4aFdwDEd6uBCpIQ7G0J5fEM";
  Future getCourse() async {
    try {
      final url =
          "https://trogon.info/tutorpro/edspark/api/my_course?auth_token=${tocken}";
      print("========= url =========");
      print(url);
      var req = await http.get(
        Uri.parse(url),
      );
      print("--------");
      print(req.body);
      return req.body;
      // print(req.body);
    } catch (e) {}
  }
}
