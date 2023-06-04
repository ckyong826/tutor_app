// ignore_for_file: unused_import

import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/components/GoogleAuth.dart';
import 'package:tutor_app/pages/loginorsignin.dart';
import 'package:tutor_app/profile/components/Co-profile.dart';
import '../main.dart';
import '../components/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import '../Root/home_page.dart';
import 'components/Co-badge.dart';
import 'components/Co-stat.dart';
import 'package:tutor_app/components/DataDetails.dart';
import 'components/readUserData.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;
  var userID;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    context.go('/ins1/ins2/ins3/options');
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getUserEmail();
      setState(() {});
    });
    super.initState();
  }

  getUserEmail() async {
    userID = await user.email;
    setState(() {
      print(userID);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(250, 226, 223, 223),
          image: DecorationImage(
            image: AssetImage("assets/home_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
              top: true,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    CoProfile(
                        userName: "Lai ZM",
                        description:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt "),
                    CoBadge(),
                    Stat(),
                  ])),
        ),
      ),
    );
  }
}
