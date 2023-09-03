import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../const.dart';

import 'package:path_provider/path_provider.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  String? reg_num = box.read('username');
  String? Fullname = box.read('FullName');
  String? name;
  String? email;
  String? photo;
  bool isLoading = true;
 
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(5, 89, 109, 1),
      width: double.infinity,
      height: 170,
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: isLoading
                  ? SpinKitFadingCircle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      size: 50.0,
                    )
                  : Image.network(
                      '${photo ?? ''}',
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
            ),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 10),
            child: Column(
              children: [
                Text(
                  
                  '${box.read('fullname') ?? ''}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '${reg_num ?? ''}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        isLoading = true;
      });
      _updateUserData(account);
    });
    _googleSignIn.signInSilently().then((GoogleSignInAccount? account) {
      setState(() {
        isLoading = true;
      });
      _updateUserData(account);
    });
  }

  void _updateUserData(GoogleSignInAccount? account) {
    if (account != null) {
      setState(() {
        name = account.displayName;
        box.write('fullname', name);
        name = box.read('fullname');
        email = account.email;
        photo = account.photoUrl;
        box.write('photo', photo);
        downloadAndSavePhoto(box.read('photo'));
        print(box.read('photo'));
        isLoading = false;
      });
    }
  }
}

Future<void> downloadAndSavePhoto(String photoUrl) async {
  try {
    Dio dio = Dio();
    Directory appDir = await getApplicationDocumentsDirectory();
    String savePath = '${appDir.path}/photo.jpg';
    await dio.download(photoUrl, savePath);
  } catch (e) {
    print('Error saving photo: $e');
  }
}
