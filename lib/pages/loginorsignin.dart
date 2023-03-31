import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signin.dart';

class LoginorSignin extends StatelessWidget {
  const LoginorSignin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //size of whole page
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Container(
          width: double.infinity,
          height: size.height,
          decoration: BoxDecoration(
            color: const Color(0xfff3f5f6),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
              child: Column(
            children: <Widget>[
              //ImageCenter
              SizedBox(height: size.height * 0.08),
              Image.asset(
                "assets/images/home1.png",
                height: size.height * 0.4,
                width: size.width * 0.7,
              ),
              SizedBox(height: size.height * 0.04),

              //Text
              Text(
                'Hello !',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  textStyle: const TextStyle(color: colorf1),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                  width: 200,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.!',
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 15.0,
                      textStyle: const TextStyle(color: colorf2),
                    ),
                  )),
              SizedBox(height: size.height * 0.07),

              //login button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pricolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fixedSize: Size((size.width * 0.75), (size.height * 0.073)),
                ),
                onPressed: () {
                  context.go('/home');
                },
                child: Text(
                  'LOG IN',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    textStyle: const TextStyle(color: colorf3),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),

              //sign up button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: colorf3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fixedSize: Size((size.width * 0.75), (size.height * 0.073)),
                  side: const BorderSide(color: pricolor, width: 2),
                ),
                onPressed: () {
                  context.go('/home');
                },
                child: Text(
                  'SIGN UP',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    textStyle: const TextStyle(color: pricolor),
                  ),
                ),
              ),
            ],
          ))),
    ));
  }
}
