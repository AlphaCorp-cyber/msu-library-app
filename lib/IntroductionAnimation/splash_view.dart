import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  final AnimationController animationController;

  const SplashView({Key? key, required this.animationController})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final introductionanimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    
    return SlideTransition(
      position: introductionanimation,
      child: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 200,),
            SizedBox(
              height: 200, // set the desired height of the image
              child: Image.asset(
                'assets/introduction_animation/logo.jpg',
                width: MediaQuery.of(context)
                    .size
                    .width, // set the width of the image to the screen width
                fit: BoxFit
                    .contain, // set the fit property to BoxFit.contain to scale the image while maintaining its aspect ratio
              ),
            ),
            SizedBox(height: 100,),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "MyLibrary",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 64, right: 64),
              child: Text(
                "The Whole Library in Your Pocket.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 18),
              child: InkWell(
                onTap: () {
                  widget.animationController.animateTo(0.2);
                },
                child: Container(
                  height: 58,
                  padding: const EdgeInsets.only(
                    left: 56.0,
                    right: 56.0,
                    top: 16,
                    bottom: 18,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: Color.fromARGB(255, 61, 188, 197),
                  ),
                  child: const Text(
                    "Let's begin",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
