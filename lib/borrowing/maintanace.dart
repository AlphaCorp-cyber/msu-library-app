import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Maintanace extends StatefulWidget {
  const Maintanace({super.key});

  @override
  State<Maintanace> createState() => _MaintanaceState();
}

class _MaintanaceState extends State<Maintanace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
       child: Lottie.asset('assets/progress.json',
                      alignment: const Alignment(0.0, 0.0),
                      repeat: true,
                      reverse: true,
                      animate: true,
                      height: 300,
                      width: 300),
     ),
    );
  }
   
  }

