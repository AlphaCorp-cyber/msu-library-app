// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'models/constant.dart';

class Init extends StatefulWidget {
  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  List<dynamic>? total = [];
  List<dynamic>? DueT = [];
  List<dynamic>? OverD = [];
  var reg_num = box.read('username');
  var length;
  var lengthO;
  bool isLoading = false;
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];
  @override
  void initState() {
    super.initState();
    fetchAll();
    fetchDueTomorrow();
    fetchOverDue();
  }

  fetchAll() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(
        Uri.parse("https://app.library.msu.ac.zw/api/borrowers/all/$reg_num"));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      final leng = items.length;
      final t = items[0]['date_due'];
      box.write('date', t);

      box.write('all', leng);

      setState(() {
        total = items;
        isLoading = false;
      });
    }
  }

  fetchOverDue() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(
        "https://app.library.msu.ac.zw/api/borrowers/overdue/$reg_num"));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      final len = items.length;
      box.write('overdue', len);
      setState(() {
        OverD = items;
        isLoading = false;
      });
    }
  }

  fetchDueTomorrow() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(
        "https://app.library.msu.ac.zw/api/borrowers/due-tomorrow/$reg_num"));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      final tom = items.length;
      box.write('tom', tom);
      setState(() {
        DueT = items;
        isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    throw UnimplementedError();
  }
}
