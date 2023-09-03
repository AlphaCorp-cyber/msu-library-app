// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dashboard/components/input_container.dart';
import 'package:dashboard/constants/color.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _clicked = false;
  double _opacity = 1.0;
  String? errorMessage = '';
  late Animation<double> containerSize;
  AnimationController? animationController;
  Duration animationDuration = const Duration(milliseconds: 270);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Future signIn() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: _emailController.text.trim(),
  //         password: _passwordController.text.trim());
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message;
  //     });
  //   }
  // }


  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
// we are using this to determine Keyboard is opened or not
    double defaultRegisterSize = size.height - (size.height * 0.1);
    containerSize =
        Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
            .animate(CurvedAnimation(
                parent: animationController!, curve: Curves.linear));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/fitness_app/login1.json',
                    alignment: const Alignment(0.0, 0.0),
                    repeat: true,
                    reverse: true,
                    animate: true,
                    height: 300,
                    width: 300),

                Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Text(
                  "Welcome Back, you've been missed!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
               SizedBox(height: 80),

                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: InputContainer(
                        child: TextField(
                          controller: _emailController,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            icon: Icon(Icons.email_outlined,
                                color: const Color.fromRGBO(5, 89, 109, 1)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: InputContainer(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.lock,
                                color: Color.fromRGBO(5, 89, 109, 1)),
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                //signin button
                Stack(
                  children: <Widget>[
                    InkWell(
                      // onTap: ,
                      child: AnimatedContainer(
                        width: _clicked ? 55 : 200,
                        height: 55,
                        curve: Curves.fastOutSlowIn,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(_clicked ? 70.0 : 30.0),
                          color: Color(0xFF05596D),
                        ),
                        duration: Duration(milliseconds: 700),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AnimatedOpacity(
                              duration: Duration(seconds: 1),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              opacity: _opacity,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _clicked = !_clicked;
                          _opacity = _opacity == 1.0 ? 0.0 : 1.0;
                          // signIn();
                        });
                      },
                      child: AnimatedContainer(
                        width: _clicked ? 55 : 200,
                        height: 55,
                        curve: Curves.fastOutSlowIn,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(_clicked ? 70.0 : 30.0),
                        ),
                        duration: Duration(milliseconds: 700),
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 700),
                          child: Padding(
                            child: CircularProgressIndicator(
                                backgroundColor: Color(0xFF05596D),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    _clicked
                                        ? Colors.grey
                                        : Color(0xFF05596D))),
                            padding: EdgeInsets.all(1),
                          ),
                          opacity: _opacity == 0.0 ? 1.0 : 0.0,
                        ),
                      ),
                    ),
                  ],
                  //           child: InkWell(
                  // onTap: signIn,
                  // borderRadius: BorderRadius.circular(30),
                  // child: Padding(
                  //   padding: const EdgeInsets.only(left: 20.0),
                  //   child: AnimatedContainer(
                  //     width: _clicked ? 55 : 200,
                  //      curve: Curves.fastOutSlowIn,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(_clicked ? 70.0 : 30.0),
                  //       color: Color(0xFF05596D),
                  //     ),
                  //     duration: Duration(milliseconds: 700),
                  //     padding: const EdgeInsets.symmetric(vertical: 20),
                  //     alignment: Alignment.center,
                  //     child: Text(
                  //       "Sign In",
                  //       style: const TextStyle(color: Colors.white, fontSize: 18),
                  //     ),
                  //   ),
                  // ),
                  //   )
                ),
                SizedBox(height: 25),

                //fogort password
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.restore),
                    Text(
                      ' Recover',
                      style: TextStyle(
                        color: Color(0xFF05596D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
