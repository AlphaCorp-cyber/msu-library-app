// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';

import 'package:dashboard/Main/fitness_app_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/auth/components/square_tile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:http/http.dart' as http;

import '../../const.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  String? Fullname;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    print(FirebaseAuth.instance.currentUser);
    // FirebaseAuth.instance.signOut();
  }

  void _showErrorSnackbar(String message) {
    AnimatedSnackBar.material(
      '$message',
      type: AnimatedSnackBarType.error,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }

  void _showSuccessSnackbar(String message) {
    AnimatedSnackBar.material(
      '$message',
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }

  void _getCurrentUser() async {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  const SizedBox(height: 150),

                  // logo
                  Lottie.asset('assets/lg.json', width: 300, height: 300),

                  const SizedBox(height: 50),

              

                  

                  // username textfield

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Login With Google',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 120),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      SquareTile(
                          onTap: () {
                            _signInWithGoogle();
                          },
                          imagePath: 'lib/auth/images/google.png'),

                      SizedBox(width: 25),

                      // apple button
                      SquareTile(
                          onTap: () {}, imagePath: 'lib/auth/images/apple.png')
                    ],
                  ),

                  const SizedBox(height: 50),

                  // not a member? register now
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<int> fetchAll(String regNum) async {
    Completer<int> completer = Completer<int>();

    try {
      var response = await http.get(
        Uri.parse("https://app.library.msu.ac.zw/api/borrowers/all/$regNum"),
      );

      if (response.statusCode == 200) {
        var items = json.decode(response.body);
        final leng = items.length;
        await box.write('all', leng);
        completer.complete(leng);
      } else {
        // Handle non-200 status code
        print('Request failed with status: ${response.statusCode}');
        completer.completeError(
            'Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exception/error that occurred during the request
      print('Error occurred: $e');
      completer.completeError(e);
    }

    return completer.future;
  }

  Future<int> fetchOverDue(String regNum) async {
    Completer<int> completer = Completer<int>();

    try {
      var response = await http.get(Uri.parse(
          "https://app.library.msu.ac.zw/api/borrowers/overdue//$regNum"));

      if (response.statusCode == 200) {
        var items = json.decode(response.body);
        final len = items.length;
        await box.write('overdue', len);
        completer.complete(len);
      } else {
        // Handle non-200 status code
        print('Request failed with status: ${response.statusCode}');
        completer.completeError(
            'Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exception/error that occurred during the request
      print('Error occurred: $e');
      completer.completeError(e);
    }

    return completer.future;
  }

  Future<int> fetchDueTomorrow(String regNum) async {
    Completer<int> completer = Completer<int>();

    try {
      var response = await http.get(
        Uri.parse(
            "https://app.library.msu.ac.zw/api/borrowers/due-tomorrow//$regNum"),
      );

      if (response.statusCode == 200) {
        var items = json.decode(response.body);
        final tom = items.length;
        await box.write('tom', tom);
        completer.complete(tom);
      } else {
        // Handle non-200 status code
        print('Request failed with status: ${response.statusCode}');
        completer.completeError(
            'Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exception/error that occurred during the request
      print('Error occurred: $e');
      completer.completeError(e);
    }

    return completer.future;
  }

  Future<void> fetchData(String regNum) async {
    int? allItems = await fetchAll(regNum);
    if (allItems != null) {
      print('All Items: $allItems');
      box.write('allItems', allItems);
    } else {
      // Handle error case
      print('Error occurred while fetching all items');
    }

    int? overdueItems = await fetchOverDue(regNum);
    if (overdueItems != null) {
      print('Overdue Items: $overdueItems');
      box.write('overdueItems', overdueItems);
    } else {
      // Handle error case
      print('Error occurred while fetching overdue items');
    }

    int? dueTomorrowItems = await fetchDueTomorrow(regNum);
    if (dueTomorrowItems != null) {
      print('Items Due Tomorrow: $dueTomorrowItems');
      box.write('dueTomorrowItems', dueTomorrowItems);
    } else {
      // Handle error case
      print('Error occurred while fetching items due tomorrow');
    }
  }

  Future<void> _signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
        'https://www.googleapis.com/auth/userinfo.email',
      ],
    );

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
              child: SpinKitFadingFour(
            color: Colors.white,
            size: 50.0,
          ));
        },
      );

      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;

        await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));

        final user = FirebaseAuth.instance.currentUser;
        if (user != null &&
            user.email != null &&
            !user.email!.endsWith('@students.msu.ac.zw')&&
    !user.email!.endsWith('@staff.msu.ac.zw')) {
          _showErrorSnackbar('Email Not Supported!');
          await FirebaseAuth.instance.signOut();
          googleSignIn.signOut();
          // clear Google sign-in data
          return Navigator.of(context, rootNavigator: true).pop();
        }

        _showSuccessSnackbar('Login Successful!');

        String? email = user!.email;
        String? name = user.displayName;
        String username = email!.split('@').first;

        box.write('username', username.toUpperCase());
        box.write('name', name?.toUpperCase());

        var reg = box.read('username');

        fetchData(reg);

        //  print('');
        //  print('');
        Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => const FitnessAppHomeScreen()),
        ));
      }
    } catch (e) {
      print('Sign-in error: $e');
      _showErrorSnackbar('Sign-in error!');
      googleSignIn.signOut();
      Navigator.of(context, rootNavigator: true)
          .pop(); // clear Google sign-in data
    }
  }
}
