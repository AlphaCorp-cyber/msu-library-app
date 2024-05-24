import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'helper/global.dart';
import 'helper/pref.dart';
import 'screen/home_screen.dart';


Future<void> main() async {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,

      themeMode: Pref.defaultTheme,

      //dark
      darkTheme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            elevation: 1,
            centerTitle: true,
            titleTextStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )),

      //light
      theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            elevation: 1,
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color.fromRGBO(5, 89, 109, 1)),
            titleTextStyle: TextStyle(
                color: Color.fromRGBO(5, 89, 109, 1), fontSize: 20, fontWeight: FontWeight.w500),
          )),

      //
      home: const  HomeScreenChat(),
    );
  }
}
 
extension AppTheme on ThemeData {
  //light text color
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;

  //button color
  Color get buttonColor =>
      brightness == Brightness.dark ? const Color.fromRGBO(5, 89, 109, 1) : const Color.fromRGBO(5, 89, 109, 1);
}
