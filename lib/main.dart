import 'package:flutter/material.dart';
import 'package:tutor_app/home_screen.dart';
import 'package:tutor_app/instruction.dart';
import 'package:tutor_app/signin.dart';
import 'package:tutor_app/details.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      initialRoute: '/firstpage',
      routes: {
        '/firstpage': (context) => const Firstp(),
        '/home': (context) => const HomeScreen(),
        '/ins1': (context) => const Ins1(),
        '/ins2': (context) => const Ins2(),
        '/ins3': (context) => const Ins3(),
        '/signup': (context) => const SignUp(),
        '/login': (context) => const LogIn(),
        '/roles': (context) => const Roles(),
        '/detailstudent': (context) => const DetailStudent(),
        '/detailtutor': (context) => const DetailTutor(),
        '/detailtutor2': (context) => const DetailTutor2(),
        '/done': (context) => const Welcome(),
      },
    ));

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
          "lib/assets/images/logo.png",
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
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Ins1()));
  }
}
