import 'package:flutter/material.dart';
import 'package:tutor_app/pages/loginorsignin.dart';
import 'package:tutor_app/pages/instruction.dart';
import 'package:tutor_app/pages/signin.dart';
import 'package:tutor_app/pages/details.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pages/Afterloginpagehomepage.dart';
import 'firebase_options.dart';
import 'package:tutor_app/pages/book_session_page.dart';
import 'package:tutor_app/pages/find_tutor_page.dart';
import 'package:tutor_app/pages/home_page.dart';
import 'package:tutor_app/pages/resources_page.dart';
import 'package:tutor_app/pages/sessions_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    initialRoute: '/3',
    routes: {
      '/firstpage': (context) => const Firstp(),
      '/home': (context) => const LoginorSignin(),
      '/ins1': (context) => const Ins1(),
      '/ins2': (context) => const Ins2(),
      '/ins3': (context) => const Ins3(),
      '/signup': (context) => const SignUpPage(),
      '/login': (context) => const LoginPage(),
      '/roles': (context) => Roles(),
      '/detailstudent': (context) => const DetailStudent(),
      '/detailtutor': (context) => const DetailTutor(),
      '/detailtutor2': (context) => const DetailTutor2(),
      '/done': (context) => const Welcome(),
      '/': (context) => const HomePage(),
      '/1': (context) => const ResourcesPage(),
      '/2': (context) => const SessionsPage(),
      '/3': (context) => const FindTutorPage(),
      '/book_session': (context) => BookSessionPage(),
    },
  ));
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
