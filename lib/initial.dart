import 'package:dashboard/IntroductionAnimation/introduction_animation_screen.dart';
import 'package:dashboard/Main/fitness_app_home_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Initial extends StatelessWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FirebaseAuth.instance.currentUser == null
            ? IntroductionAnimationScreen()
            : FitnessAppHomeScreen());
  }
}
