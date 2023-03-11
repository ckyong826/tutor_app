import 'dart:ui';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _formfield = GlobalKey<FormState>();
final emailController = TextEditingController();
final passController = TextEditingController();
bool isValid = true;
bool passToggle = false;
bool isEmailValid = false;
bool isPassValid = false;
bool printValid = false;

bool isEmail(String str) {
  return _email.hasMatch(str.toLowerCase());
}

bool isPass(String str) {
  return _pass.hasMatch(str.toLowerCase());
}

RegExp _email = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
RegExp _pass = RegExp(r'^.{8,}$');

//Sign Up
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //size of whole page
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: colorf3,
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.964,
                      child: Stack(children: <Widget>[
                        Positioned(
                          child: ImageFiltered(
                            // blurWFR (155:803)
                            imageFilter: ImageFilter.blur(
                              sigmaX: 100,
                              sigmaY: 100,
                            ),
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 80, 80, 0),
                              width: size.width * 0.8,
                              height: size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(129.5),
                                color: tricolor,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            "lib/assets/images/login.png",
                            height: size.height * 0.3,
                            width: size.width,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.28),
                          height: size.height,
                          width: size.width,
                          decoration: const BoxDecoration(
                              color: colorf3,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              )),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                SizedBox(height: size.height * 0.03),
                                Row(
                                  children: [
                                    SizedBox(width: size.width * 0.11),
                                    Text(
                                      'Sign Up',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                        letterSpacing: 1.0,
                                        textStyle:
                                            const TextStyle(color: colorf1),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: size.width * 0.11),
                                    Text(
                                      'Let’s create your account !',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0,
                                        letterSpacing: 1.0,
                                        textStyle:
                                            const TextStyle(color: colorf2),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.03),
                                Row(
                                  children: [
                                    SizedBox(width: size.width * 0.23),
                                    Text(
                                      'Email',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        textStyle:
                                            const TextStyle(color: colorf2),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.01),
                                Center(
                                  child: Container(
                                      width: size.width * 0.6,
                                      height: 37,
                                      decoration: BoxDecoration(
                                        color: colorcon,
                                        borderRadius: BorderRadius.circular(29),
                                      ),
                                      child: TextFormField(
                                        onChanged: (val) {
                                          setState(() {
                                            isEmailValid = isEmail(val);
                                          });
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: emailController,
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                          textStyle:
                                              const TextStyle(color: colorf1),
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 14),
                                          border: InputBorder.none,
                                          hintText: "SomeThing@email.com",
                                          hintStyle:
                                              const TextStyle(color: colorf25),
                                          suffixIcon: isEmailValid == false
                                              ? const Icon(
                                                  Icons.close_sharp,
                                                  color: seccolor,
                                                )
                                              : const Icon(
                                                  Icons.done,
                                                  color: Colors.green,
                                                ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade200,
                                                  width: 0),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: isEmailValid == false
                                                    ? seccolor
                                                    : Colors.green,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      )),
                                ),
                                SizedBox(height: size.height * 0.023),
                                Row(
                                  children: [
                                    SizedBox(width: size.width * 0.23),
                                    Text(
                                      'Password',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        textStyle:
                                            const TextStyle(color: colorf2),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.007),
                                Center(
                                  child: Container(
                                    width: size.width * 0.6,
                                    height: 37,
                                    decoration: BoxDecoration(
                                      color: colorcon,
                                      borderRadius: BorderRadius.circular(29),
                                    ),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        setState(() {
                                          isPassValid = isPass(val);
                                        });
                                      },
                                      obscureText: !passToggle,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: passController,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                        textStyle:
                                            const TextStyle(color: colorf1),
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                        border: InputBorder.none,
                                        hintText: "At least 8 characters",
                                        hintStyle:
                                            const TextStyle(color: colorf25),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200,
                                                width: 0),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: isPassValid == false
                                                  ? seccolor
                                                  : Colors.green,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        suffixIcon: InkWell(
                                          child: Icon(
                                            passToggle
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: colorf2,
                                          ),
                                          onTap: () {
                                            setState(
                                              () {
                                                passToggle = !passToggle;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.025),
                                printValid
                                    ? const ValidPrint()
                                    : const Text(''),
                                SizedBox(height: size.height * 0.015),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: pricolor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      fixedSize: Size((size.width * 0.75),
                                          (size.height * 0.073)),
                                    ),
                                    onPressed: () {
                                      isValid = (isEmailValid && isPassValid);
                                      if (isValid == true) {
                                        print("Sign Up Successfully");
                                        emailController.clear();
                                        passController.clear();
                                        Navigator.of(context)
                                            .pushNamed('/roles');
                                        isValid = true;
                                        passToggle = false;
                                        isEmailValid = false;
                                        isPassValid = false;
                                        printValid = false;
                                      } else {
                                        setState(
                                          () {
                                            printValid = true;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'SIGN UP',
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        textStyle:
                                            const TextStyle(color: colorf3),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.015),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Already have your account?',
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0,
                                        letterSpacing: 1.0,
                                        textStyle:
                                            const TextStyle(color: colorf2),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed('/login');
                                      },
                                      child: Text(
                                        ' Log In',
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                          letterSpacing: 1.0,
                                          textStyle:
                                              const TextStyle(color: colorf2),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: size.height * 0.035),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      width: size.width * 0.3,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(color: colorf15),
                                      )),
                                    ),
                                    const FaIcon(
                                      FontAwesomeIcons.solidBookmark,
                                      color: colorf15,
                                      size: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      width: size.width * 0.3,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(color: colorf15),
                                      )),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.025),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    FaIcon(
                                      FontAwesomeIcons.google,
                                      color: colorf15,
                                    ),
                                    SizedBox(width: 25),
                                    FaIcon(
                                      FontAwesomeIcons.squareFacebook,
                                      color: colorf15,
                                      size: 30,
                                    ),
                                    SizedBox(width: 25),
                                    FaIcon(
                                      FontAwesomeIcons.apple,
                                      color: colorf15,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ]),
                    )
                  ],
                ))));
  }
}

//Log In
class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogIn();
}

class _LogIn extends State<LogIn> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //size of whole page

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: colorf3,
        body: SafeArea(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.964,
                  child: Stack(children: <Widget>[
                    Positioned(
                      child: ImageFiltered(
                        // blurWFR (155:803)
                        imageFilter: ImageFilter.blur(
                          sigmaX: 100,
                          sigmaY: 100,
                        ),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 80, 80, 0),
                          width: size.width * 0.8,
                          height: size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(129.5),
                            color: tricolor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Image.asset(
                        "lib/assets/images/login.png",
                        height: size.height * 0.3,
                        width: size.width,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.28),
                      height: size.height,
                      width: size.width,
                      decoration: const BoxDecoration(
                          color: colorf3,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.11),
                                Text(
                                  'Log In',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    letterSpacing: 1.0,
                                    textStyle: const TextStyle(color: colorf1),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.11),
                                Text(
                                  'Let’s study together !',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.0,
                                    letterSpacing: 1.0,
                                    textStyle: const TextStyle(color: colorf2),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.23),
                                Text(
                                  'Email',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    textStyle: const TextStyle(color: colorf2),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.01),
                            Center(
                              child: Container(
                                  width: size.width * 0.6,
                                  height: 37,
                                  decoration: BoxDecoration(
                                    color: colorcon,
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        isEmailValid = isEmail(val);
                                      });
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      textStyle:
                                          const TextStyle(color: colorf1),
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 14),
                                      border: InputBorder.none,
                                      hintText: "SomeThing@email.com",
                                      hintStyle:
                                          const TextStyle(color: colorf25),
                                      suffixIcon: isEmailValid == false
                                          ? const Icon(
                                              Icons.close_sharp,
                                              color: seccolor,
                                            )
                                          : const Icon(
                                              Icons.done,
                                              color: Colors.green,
                                            ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade200,
                                              width: 0),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: isEmailValid == false
                                                ? seccolor
                                                : Colors.green,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(height: size.height * 0.023),
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.23),
                                Text(
                                  'Password',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    textStyle: const TextStyle(color: colorf2),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.007),
                            Center(
                              child: Container(
                                width: size.width * 0.6,
                                height: 37,
                                decoration: BoxDecoration(
                                  color: colorcon,
                                  borderRadius: BorderRadius.circular(29),
                                ),
                                child: TextFormField(
                                  onChanged: (val) {
                                    setState(() {
                                      isPassValid = isPass(val);
                                    });
                                  },
                                  obscureText: !passToggle,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passController,
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                    textStyle: const TextStyle(color: colorf1),
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    border: InputBorder.none,
                                    hintText: "At least 8 characters",
                                    hintStyle: const TextStyle(color: colorf25),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 0),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: isPassValid == false
                                              ? seccolor
                                              : Colors.green,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    suffixIcon: InkWell(
                                      child: Icon(
                                        passToggle
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: colorf2,
                                      ),
                                      onTap: () {
                                        setState(
                                          () {
                                            passToggle = !passToggle;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.025),
                            printValid ? const ValidPrint() : const Text(''),
                            SizedBox(height: size.height * 0.015),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: pricolor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  fixedSize: Size((size.width * 0.75),
                                      (size.height * 0.073)),
                                ),
                                onPressed: () {
                                  isValid = (isEmailValid && isPassValid);
                                  if (isValid == true) {
                                    print("Log In Successfully");
                                    emailController.clear();
                                    passController.clear();
                                    Navigator.of(context).pushNamed('/home');
                                    isValid = true;
                                    passToggle = false;
                                    isEmailValid = false;
                                    isPassValid = false;
                                    printValid = false;
                                  } else {
                                    setState(
                                      () {
                                        printValid = true;
                                      },
                                    );
                                  }
                                },
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'LOG IN',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    textStyle: const TextStyle(color: colorf3),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.015),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Forgot your password ?',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.0,
                                    letterSpacing: 1.0,
                                    textStyle: const TextStyle(color: colorf2),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    ' Click here',
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      letterSpacing: 1.0,
                                      textStyle:
                                          const TextStyle(color: colorf2),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: size.height * 0.035),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  width: size.width * 0.3,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(color: colorf15),
                                  )),
                                ),
                                const FaIcon(
                                  FontAwesomeIcons.solidBookmark,
                                  color: colorf15,
                                  size: 20,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  width: size.width * 0.3,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(color: colorf15),
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.025),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.google,
                                  color: colorf15,
                                ),
                                SizedBox(width: 25),
                                FaIcon(
                                  FontAwesomeIcons.squareFacebook,
                                  color: colorf15,
                                  size: 30,
                                ),
                                SizedBox(width: 25),
                                FaIcon(
                                  FontAwesomeIcons.apple,
                                  color: colorf15,
                                  size: 30,
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ]),
                )
              ],
            ),
          ),
        )));
  }
}

//Roles
class Roles extends StatelessWidget {
  const Roles({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //size of whole page
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: colorf3,
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.964,
                      child: Stack(children: <Widget>[
                        // blur
                        Positioned(
                          child: ImageFiltered(
                            // blurWFR (155:803)
                            imageFilter: ImageFilter.blur(
                              sigmaX: 100,
                              sigmaY: 100,
                            ),
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 80, 80, 0),
                              width: size.width * 0.8,
                              height: size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(129.5),
                                color: tricolor,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            "lib/assets/images/login.png",
                            height: size.height * 0.3,
                            width: size.width,
                          ),
                        ),
                        //WhiteContainer
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.28),
                          height: size.height,
                          width: size.width,
                          decoration: const BoxDecoration(
                              color: colorf3,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              )),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                SizedBox(height: size.height * 0.03),
                                Row(
                                  children: [
                                    SizedBox(width: size.width * 0.11),
                                    Text(
                                      'Sign Up',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                        letterSpacing: 1.0,
                                        textStyle:
                                            const TextStyle(color: colorf1),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: size.width * 0.11),
                                    Text(
                                      'Let’s create your account !',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0,
                                        letterSpacing: 1.0,
                                        textStyle:
                                            const TextStyle(color: colorf2),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.05),
                                Center(
                                  child: Text(
                                    'Roles',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                      letterSpacing: 1.0,
                                      textStyle:
                                          const TextStyle(color: colorf1),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.05),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed('/detailstudent');
                                          },
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    alignment: FractionalOffset
                                                        .topCenter,
                                                    image: AssetImage(
                                                        "lib/assets/images/student.png"))),
                                          ),
                                        ),
                                        SizedBox(height: size.height * 0.01),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed('/detailstudent');
                                          },
                                          child: Text(
                                            'Student',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12.0,
                                              letterSpacing: 1.0,
                                              textStyle: const TextStyle(
                                                  color: colorf2),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(width: size.width * 0.11),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed('/detailtutor');
                                          },
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    alignment: FractionalOffset
                                                        .topCenter,
                                                    image: AssetImage(
                                                        "lib/assets/images/tutor.png"))),
                                          ),
                                        ),
                                        SizedBox(height: size.height * 0.01),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed('/detailtutor');
                                            },
                                            child: Text(
                                              'Tutor',
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12.0,
                                                letterSpacing: 1.0,
                                                textStyle: const TextStyle(
                                                    color: colorf2),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.05),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Already have your account?',
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0,
                                        letterSpacing: 1.0,
                                        textStyle:
                                            const TextStyle(color: colorf2),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed('/login');
                                      },
                                      child: Text(
                                        ' Log In',
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                          letterSpacing: 1.0,
                                          textStyle:
                                              const TextStyle(color: colorf2),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: size.height * 0.035),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      width: size.width * 0.3,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(color: colorf15),
                                      )),
                                    ),
                                    const FaIcon(
                                      FontAwesomeIcons.solidBookmark,
                                      color: colorf15,
                                      size: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      width: size.width * 0.3,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(color: colorf15),
                                      )),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.025),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    FaIcon(
                                      FontAwesomeIcons.google,
                                      color: colorf15,
                                    ),
                                    SizedBox(width: 25),
                                    FaIcon(
                                      FontAwesomeIcons.squareFacebook,
                                      color: colorf15,
                                      size: 30,
                                    ),
                                    SizedBox(width: 25),
                                    FaIcon(
                                      FontAwesomeIcons.apple,
                                      color: colorf15,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ]),
                    )
                  ],
                ))));
  }
}

class ValidPrint extends StatelessWidget {
  const ValidPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Please Enter Valid Email and Password',
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          fontSize: 10.0,
          textStyle: const TextStyle(color: seccolor),
        ),
      ),
    );
  }
}
