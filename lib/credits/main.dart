// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/vertical_marquee_text.dart';


void main() {
  runApp(const Credits());
}

class Credits extends StatelessWidget {
  const Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credits',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Credits')),
        backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.1),
            child: SizedBox(
              height: screenHeight * 0.6,
              child: const VerticalMarqueeText(
                marqueeDirection: MarqueeDirection.btt,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Color.fromRGBO(5, 89, 109, 1)),
                  children: <InlineSpan>[
                    TextSpan(
                      text: '''

CREDITS

We would like to express our heartfelt
appreciation and recognition to the 
talented team of NerdiQ developers,
Computer Science Department 
and the Innovation Hub who have brought this 
incredible software to life. Their dedication, 
expertise, and tireless efforts have resulted 
in a remarkable product that has revolutionized 
the way we work and interact with technology. 
Their commitment to excellence, attention to detail, 
and innovative thinking have made this software a 
true game-changer in its field. We extend our sincere  
gratitude to each and every developer involved, for 
their exceptional skills, unwavering determination, and 
passion for creating something extraordinary. 
Your hard work and ingenuity have not gone unnoticed, 
and we are truly grateful for the invaluable contributions 
you have made to this software. Thank you for your 
outstanding work and for enriching our lives 
with this remarkable creation.

NerdiQ Team:

Tendai Gatahwa

Brandon Dlamini

Alpha K Tembo

Godnson Moyo

Tafadzwa Marimbita

Rufaro Sithole
''',
                    ),
                  ],
                ),
                speed: 10,
              ),
            ),
          ),
           // Add spacing between text and image
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Black.png', // Replace with the actual path to your first image
                width: screenHeight * 0.1,
                height: screenHeight * 0.1,
              ),
              SizedBox(width: screenHeight * 0.02), // Add spacing between images
              Image.asset(
                'assets/inn.png', // Replace with the actual path to your second image
                width: screenHeight * 0.1,
                height: screenHeight * 0.1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}