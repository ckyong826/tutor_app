import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/constants.dart';
import 'package:google_fonts/google_fonts.dart';

//Instruction1
class Ins1 extends StatelessWidget {
  const Ins1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //size of whole page
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        children: <Widget>[
          //ImageCenter
          SizedBox(height: size.height * 0.13),
          Image.asset(
            "assets/images/ins1.png",
            height: size.height * 0.4,
            width: size.width * 0.7,
          ),
          SizedBox(height: size.height * 0.04),
          //Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Study ',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  textStyle: const TextStyle(color: pricolor),
                ),
              ),
              Text(
                'Free',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  textStyle: const TextStyle(color: colorf1),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          SizedBox(
              width: 210,
              child: Text(
                textAlign: TextAlign.center,
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus porta augue nec nulla ',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0,
                  textStyle: const TextStyle(color: colorf2),
                ),
              )),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.fiber_manual_record, color: pricolor, size: 11),
              SizedBox(width: size.width * 0.02),
              const Icon(Icons.fiber_manual_record,
                  color: Color(0xFFD6D6D6), size: 11),
              SizedBox(width: size.width * 0.02),
              const Icon(Icons.fiber_manual_record,
                  color: Color(0xFFD6D6D6), size: 11),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          //login button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: pricolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              fixedSize: Size((size.width * 0.75), (size.height * 0.073)),
            ),
            onPressed: () {
              context.go('/ins1/ins2');
            },
            child: Text(
              textAlign: TextAlign.center,
              'NEXT',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                textStyle: const TextStyle(color: colorf3),
              ),
            ),
          ),
        ],
      )),
    ));
  }
}

//Instruction2
class Ins2 extends StatelessWidget {
  const Ins2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //size of whole page
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        children: <Widget>[
          //ImageCenter
          SizedBox(height: size.height * 0.13),
          Image.asset(
            "assets/images/ins2.png",
            height: size.height * 0.4,
            width: size.width * 0.7,
          ),
          SizedBox(height: size.height * 0.04),
          //Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Free ',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  textStyle: const TextStyle(color: colorf1),
                ),
              ),
              Text(
                'Tutor',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  textStyle: const TextStyle(color: seccolor),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          SizedBox(
              width: 210,
              child: Text(
                textAlign: TextAlign.center,
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus porta augue nec nulla ',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0,
                  textStyle: const TextStyle(color: colorf2),
                ),
              )),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.fiber_manual_record,
                  color: Color(0xFFD6D6D6), size: 11),
              SizedBox(width: size.width * 0.02),
              const Icon(Icons.fiber_manual_record, color: seccolor, size: 11),
              SizedBox(width: size.width * 0.02),
              const Icon(Icons.fiber_manual_record,
                  color: Color(0xFFD6D6D6), size: 11),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          //login button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: seccolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              fixedSize: Size((size.width * 0.75), (size.height * 0.073)),
            ),
            onPressed: () {
              context.go('/ins1/ins2/ins3');
            },
            child: Text(
              textAlign: TextAlign.center,
              'NEXT',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                textStyle: const TextStyle(color: colorf3),
              ),
            ),
          ),
        ],
      )),
    ));
  }
}

//Instruction3
class Ins3 extends StatelessWidget {
  const Ins3({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //size of whole page
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        children: <Widget>[
          //ImageCenter
          SizedBox(height: size.height * 0.13),
          Image.asset(
            "assets/images/ins3.png",
            height: size.height * 0.4,
            width: size.width * 0.7,
          ),
          SizedBox(height: size.height * 0.04),
          //Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Have ',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  textStyle: const TextStyle(color: colorf1),
                ),
              ),
              Text(
                'Fun',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  textStyle: const TextStyle(color: tricolor),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          SizedBox(
              width: 210,
              child: Text(
                textAlign: TextAlign.center,
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus porta augue nec nulla ',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0,
                  textStyle: const TextStyle(color: colorf2),
                ),
              )),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.fiber_manual_record,
                  color: Color(0xFFD6D6D6), size: 11),
              SizedBox(width: size.width * 0.02),
              const Icon(Icons.fiber_manual_record,
                  color: Color(0xFFD6D6D6), size: 11),
              SizedBox(width: size.width * 0.02),
              const Icon(Icons.fiber_manual_record, color: tricolor, size: 11),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          //login button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: tricolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              fixedSize: Size((size.width * 0.75), (size.height * 0.073)),
            ),
            onPressed: () {
              context.go('/ins1/ins2/ins3/login');
            },
            child: Text(
              textAlign: TextAlign.center,
              'GET STARTED',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                textStyle: const TextStyle(color: colorf3),
              ),
            ),
          ),
        ],
      )),
    ));
  }
}

class Firstp extends StatefulWidget {
  const Firstp({super.key});

  @override
  State<Firstp> createState() => Fpage();
}

class Fpage extends State<Firstp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(children: <Widget>[
        Image.asset(
          "assets/images/logo.png",
          height: size.height * 0.9,
          width: size.width,
        ),
      ]),
    ));
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    context.go('/ins1');
  }
}
