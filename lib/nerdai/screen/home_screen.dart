// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


import '../helper/global.dart';
import '../helper/pref.dart';
import '../model/home_type.dart';
import '../widget/home_card.dart';

class HomeScreenChat extends StatefulWidget {
  const HomeScreenChat({super.key});

  @override
  State<HomeScreenChat> createState() => _HomeScreenChatState();
}

class _HomeScreenChatState extends State<HomeScreenChat> {
  final _isDarkMode = Pref.isDarkMode.obs;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    //initializing device size
    mq = MediaQuery.sizeOf(context);

    //sample api call
    // APIs.getAnswer('hii');

    return Scaffold(
      //app bar
      // appBar: AppBar(
      //   title: const Text('Tools'),

      //   //
      //   actions: [
      //     IconButton(
      //         padding: const EdgeInsets.only(right: 10),
      //         onPressed: () {
      //           Get.changeThemeMode(
      //               _isDarkMode.value ? ThemeMode.light : ThemeMode.dark);

      //           _isDarkMode.value = !_isDarkMode.value;
      //           Pref.isDarkMode = _isDarkMode.value;
      //         },
      //         icon: Obx(() => Icon(
      //             _isDarkMode.value
      //                 ? Icons.brightness_2_rounded
      //                 : Icons.brightness_5_rounded,
      //             size: 26)))
      //   ],
      // ),

      //ad
      

      //body
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .015),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),
    );
  }
}
