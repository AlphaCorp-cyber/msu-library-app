import 'dart:io';

import 'package:dashboard/Main/drawer.dart';
import 'package:dashboard/Main/models/tabIcon_data.dart';
import 'package:dashboard/Main/my_diary_screen.dart';
import 'package:dashboard/Screens/home_screen.dart';
import 'package:dashboard/auth/pages/login_page.dart';

import 'package:dashboard/nerdai/screen/home_screen.dart';
import 'package:dashboard/themes/fitness_app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../eresources/pastpapers/downloads.dart';
import '../pages/aboutus.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'package:get_storage/get_storage.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  const FitnessAppHomeScreen({Key? key}) : super(key: key);

  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  final _themeData = GetStorage();

  bool _isDarkMode = false;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      _themeData.write("darkmode", _isDarkMode);
    });
  }

  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
    _isDarkMode = _themeData.read("darkmode") ?? false;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Container(
      decoration: BoxDecoration(
        color: _isDarkMode ? Colors.black : FitnessAppTheme.background,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
          elevation: 1,
          centerTitle: false,
          title: const Text(
            'myLibrary',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
           iconTheme: IconThemeData(
          color: Colors.white, // This changes the drawer icon to white
        ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                final googleSignIn = GoogleSignIn();
                final box = GetStorage();
                try {
                  await box.erase();
                  box.write('allItems', 0);
                   box.write('overdueItems', 0);
                    box.write('penalty', 0);
                     box.write('dueTomorrowItems', 0);
                  await googleSignIn.signOut();
                } catch (e) {
                  print('Error signing out of Google: $e');
                }
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: ((context) => LoginPage()),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const About())));
              },
            ),
          ],
        ),
        drawer: const MainDrawer(),
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = HomeScreenChat();
                });
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = Downloads();
                });
              });
            } else if (index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = HomeScreen();
                });
              });
            }
          },
        ),
      ],
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
