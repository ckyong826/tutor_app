import 'dart:ui';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dropdown_button2/src/dropdown_button2.dart';

final usernameController = TextEditingController();
final schoolController = TextEditingController();

bool isUsernameblank = false;
bool isLevelblank = false;
bool isSchoolblank = false;
bool isAcedemicblank = false;
bool isValid = false;
bool printValid = false;

//Detail Student
class DetailStudent extends StatefulWidget {
  const DetailStudent({super.key});
  @override
  State<DetailStudent> createState() => _DetailStudent();
}

class _DetailStudent extends State<DetailStudent> {
  final List<String> LEVEL = ['PT3', 'SPM', 'UEC', 'IGCSE'];
  final List<String> ACEDEMIC = [
    'Form 1',
    'Form 2',
    'Form 3',
    'Form 4',
    'Form 5',
  ];
  String? dropdownValueLEVEL;
  String? dropdownValueACEDEMIC;
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
                  //blur
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
                                  textStyle: const TextStyle(color: colorf1),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.11),
                              Text(
                                'Fill in your details as student !',
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
                          SizedBox(height: size.height * 0.01),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.23),
                              Text(
                                'Username',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  textStyle: const TextStyle(color: colorf2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.005),
                          Center(
                            child: Container(
                              width: size.width * 0.6,
                              height: 37,
                              decoration: BoxDecoration(
                                color: colorcon,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == '') {
                                        isUsernameblank = true;
                                      } else {
                                        isUsernameblank = false;
                                      }
                                    });
                                  },
                                  keyboardType: TextInputType.name,
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    border: InputBorder.none,
                                    hintText: "Ali123",
                                    hintStyle: const TextStyle(color: colorf25),
                                    suffixIcon: isUsernameblank == false
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
                                          color: isUsernameblank == false
                                              ? seccolor
                                              : Colors.green,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(height: size.height * 0.007),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.23),
                              Text(
                                'Level',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  textStyle: const TextStyle(color: colorf2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.005),
                          Center(
                              child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.6,
                            height: 37,
                            decoration: BoxDecoration(
                              color: colorcon,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                              hint: Text(
                                'Choose Level',
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  textStyle: const TextStyle(color: colorf1),
                                ),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 100,
                                width: size.width * 0.6,
                                elevation: 2,
                                offset: const Offset(-20, -15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 15.0,
                                  color: colorf2,
                                ),
                              ),
                              isExpanded: true,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                textStyle: const TextStyle(color: colorf1),
                              ),
                              value: dropdownValueLEVEL,
                              items: LEVEL.map<DropdownMenuItem<String>>(
                                (item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  isLevelblank = true;
                                  dropdownValueLEVEL = newValue!;
                                });
                              },
                            )),
                          )),
                          SizedBox(height: size.height * 0.007),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.23),
                              Text(
                                'School',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  textStyle: const TextStyle(color: colorf2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.005),
                          Center(
                            child: Container(
                              width: size.width * 0.6,
                              height: 37,
                              decoration: BoxDecoration(
                                color: colorcon,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {}
                                      isUsernameblank = true;
                                    });
                                  },
                                  keyboardType: TextInputType.name,
                                  controller: schoolController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    border: InputBorder.none,
                                    hintText: "SMK Tawau",
                                    hintStyle: const TextStyle(color: colorf25),
                                    suffixIcon: isUsernameblank == false
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
                                          color: isUsernameblank == false
                                              ? seccolor
                                              : Colors.green,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(height: size.height * 0.007),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.23),
                              Text(
                                'Acedemic',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  textStyle: const TextStyle(color: colorf2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.005),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: size.width * 0.6,
                              height: 37,
                              decoration: BoxDecoration(
                                color: colorcon,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                hint: Text(
                                  'Choose Acedemic',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                    textStyle: const TextStyle(color: colorf1),
                                  ),
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 100,
                                  width: size.width * 0.6,
                                  elevation: 2,
                                  offset: const Offset(-20, -15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness:
                                        MaterialStateProperty.all<double>(6),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: FaIcon(
                                    FontAwesomeIcons.chevronDown,
                                    size: 15.0,
                                    color: colorf2,
                                  ),
                                ),
                                isExpanded: true,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  textStyle: const TextStyle(color: colorf1),
                                ),
                                value: dropdownValueACEDEMIC,
                                items: ACEDEMIC.map<DropdownMenuItem<String>>(
                                  (item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    );
                                  },
                                ).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    isAcedemicblank = true;
                                    dropdownValueACEDEMIC = newValue!;
                                  });
                                },
                              )),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          printValid ? const ValidPrint() : const Text(''),
                          SizedBox(height: size.height * 0.01),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: pricolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fixedSize: Size(
                                    (size.width * 0.75), (size.height * 0.073)),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/done');
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
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Already have your account?',
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0,
                                  letterSpacing: 1.0,
                                  textStyle: const TextStyle(color: colorf2),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  isValid = (isLevelblank &&
                                      isUsernameblank &&
                                      isAcedemicblank &&
                                      isSchoolblank);
                                  if (isValid == true) {
                                    print("Fill in Successfully");
                                    usernameController.clear();
                                    schoolController.clear();
                                    Navigator.of(context).pushNamed('/roles');
                                    isValid = true;
                                    isLevelblank = false;
                                    isUsernameblank = false;
                                    isAcedemicblank = false;
                                    isSchoolblank = false;
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
                                  ' Log In',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                    letterSpacing: 1.0,
                                    textStyle: const TextStyle(color: colorf2),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ]),
              )
            ],
          ),
        )));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

//Detail Tutor
class DetailTutor extends StatefulWidget {
  const DetailTutor({super.key});
  @override
  State<DetailTutor> createState() => _DetailTutor();
}

class _DetailTutor extends State<DetailTutor> {
  final List<String> LEVEL = [
    'Form 6/A-Level/Matriculation',
    'Undergraduate',
    'Postgraduate',
    'Employed Teacher'
  ];
  final List<String> ACEDEMIC = [
    'Form 6',
    'Pre U',
    'Year 1',
    'Year 2',
    'Year 3',
    'Year 4',
    'Year 5',
  ];
  String? dropdownValueLEVEL;
  String? dropdownValueACEDEMIC;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //size of whole page
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: colorf3,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.964,
              child: Stack(children: <Widget>[
                //blur
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
                                textStyle: const TextStyle(color: colorf1),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.11),
                            Text(
                              'Fill in your details as tutor !',
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
                              'Username',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.6,
                            height: 37,
                            decoration: BoxDecoration(
                              color: colorcon,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextFormField(
                                decoration: const InputDecoration(
                              border: InputBorder.none,
                            )),
                          ),
                        ),
                        SizedBox(height: size.height * 0.007),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.23),
                            Text(
                              'Level',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Center(
                            child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          width: size.width * 0.6,
                          height: 37,
                          decoration: BoxDecoration(
                            color: colorcon,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            hint: Text(
                              'Choose Level',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                textStyle: const TextStyle(color: colorf1),
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 100,
                              width: size.width * 0.6,
                              elevation: 2,
                              offset: const Offset(-20, -15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: FaIcon(
                                FontAwesomeIcons.chevronDown,
                                size: 15.0,
                                color: colorf2,
                              ),
                            ),
                            isExpanded: true,
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              textStyle: const TextStyle(color: colorf1),
                            ),
                            value: dropdownValueLEVEL,
                            items: LEVEL.map<DropdownMenuItem<String>>(
                              (item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValueLEVEL = newValue!;
                              });
                            },
                          )),
                        )),
                        SizedBox(height: size.height * 0.007),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.23),
                            Text(
                              'School',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.6,
                            height: 37,
                            decoration: BoxDecoration(
                              color: colorcon,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextFormField(
                                decoration: const InputDecoration(
                              border: InputBorder.none,
                            )),
                          ),
                        ),
                        SizedBox(height: size.height * 0.007),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.23),
                            Text(
                              'Acedemic',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.6,
                            height: 37,
                            decoration: BoxDecoration(
                              color: colorcon,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                              hint: Text(
                                'Choose Acedemic',
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  textStyle: const TextStyle(color: colorf1),
                                ),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 100,
                                width: size.width * 0.6,
                                elevation: 2,
                                offset: const Offset(-20, -15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 15.0,
                                  color: colorf2,
                                ),
                              ),
                              isExpanded: true,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                textStyle: const TextStyle(color: colorf1),
                              ),
                              value: dropdownValueACEDEMIC,
                              items: ACEDEMIC.map<DropdownMenuItem<String>>(
                                (item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValueACEDEMIC = newValue!;
                                });
                              },
                            )),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        const ValidPrint(),
                        SizedBox(height: size.height * 0.01),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: pricolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fixedSize: Size(
                                  (size.width * 0.75), (size.height * 0.073)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/detailtutor2');
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
                        ),
                        SizedBox(height: size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already have your account?',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                                letterSpacing: 1.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: Text(
                                ' Log In',
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  letterSpacing: 1.0,
                                  textStyle: const TextStyle(color: colorf2),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ]),
            )
          ],
        )));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

//Detail Tutor2
class DetailTutor2 extends StatefulWidget {
  const DetailTutor2({super.key});
  @override
  State<DetailTutor2> createState() => _DetailTutor2();
}

class _DetailTutor2 extends State<DetailTutor2> {
  final List<String> items = [
    'Sejarah',
    'Math',
    'AddMath',
    'Biology',
    'Chemistry',
    'Physic',
    'Malay',
    'English',
    'Moral',
    'Islam',
  ];
  List<String> selectedItems = [];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //size of whole page
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorf3,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.964,
              child: Stack(children: <Widget>[
                //blur
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
                                textStyle: const TextStyle(color: colorf1),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.11),
                            Text(
                              'Fill in your details as tutor !',
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
                              'Name',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.6,
                            height: 37,
                            decoration: BoxDecoration(
                              color: colorcon,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextFormField(
                                decoration: const InputDecoration(
                              border: InputBorder.none,
                            )),
                          ),
                        ),
                        SizedBox(height: size.height * 0.007),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.23),
                            Text(
                              'Subject',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Center(
                            child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          width: size.width * 0.6,
                          height: 37,
                          decoration: BoxDecoration(
                            color: colorcon,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            hint: Text(
                              'Choose Subject',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                textStyle: const TextStyle(color: colorf1),
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: size.width * 0.6,
                              elevation: 2,
                              offset: const Offset(-20, -15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: FaIcon(
                                FontAwesomeIcons.chevronDown,
                                size: 15.0,
                                color: colorf2,
                              ),
                            ),
                            isExpanded: true,
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              textStyle: const TextStyle(color: colorf1),
                            ),
                            items: items.map<DropdownMenuItem<String>>((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                enabled: false,
                                child: StatefulBuilder(
                                  builder: (context, menuSetState) {
                                    final isSelected =
                                        selectedItems.contains(item);
                                    return InkWell(
                                      onTap: () {
                                        isSelected
                                            ? selectedItems.remove(item)
                                            : selectedItems.add(item);
                                        //This rebuilds the StatefulWidget to update the button's text
                                        setState(() {});
                                        //This rebuilds the dropdownMenu Widget to update the check mark
                                        menuSetState(() {});
                                      },
                                      child: Container(
                                        height: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            const Expanded(child: SizedBox()),
                                            isSelected
                                                ? const Icon(
                                                    Icons.check_circle_outline,
                                                    size: 20.0,
                                                    color: colorf1,
                                                  )
                                                : const Icon(
                                                    Icons.circle_outlined,
                                                    size: 20.0,
                                                    color: colorf1,
                                                  ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                            value: selectedItems.isEmpty
                                ? null
                                : selectedItems.last,
                            onChanged: (value) {},
                            selectedItemBuilder: (context) {
                              return items.map(
                                (item) {
                                  return Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      selectedItems.join(', '),
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                        textStyle:
                                            const TextStyle(color: colorf1),
                                      ),
                                      maxLines: 1,
                                    ),
                                  );
                                },
                              ).toList();
                            },
                          )),
                        )),
                        SizedBox(height: size.height * 0.007),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.23),
                            Text(
                              'Result',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.6,
                            height: 37,
                            decoration: BoxDecoration(
                              color: colorcon,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextFormField(
                                decoration: const InputDecoration(
                              border: InputBorder.none,
                            )),
                          ),
                        ),
                        SizedBox(height: size.height * 0.007),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.23),
                            Text(
                              'Proof',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Center(
                            child: Container(
                          width: size.width * 0.6,
                          height: 37,
                          decoration: BoxDecoration(
                            color: colorcon,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.circlePlus,
                                  size: 18.0,
                                  color: colorf2,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        )),
                        SizedBox(height: size.height * 0.03),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: pricolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fixedSize: Size(
                                  (size.width * 0.75), (size.height * 0.073)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/done');
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
                        ),
                        SizedBox(height: size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already have your account?',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                                letterSpacing: 1.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: Text(
                                ' Log In',
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  letterSpacing: 1.0,
                                  textStyle: const TextStyle(color: colorf2),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

//Detail Student
class Welcome extends StatefulWidget {
  const Welcome({super.key});
  @override
  State<Welcome> createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //size of whole page
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: colorf3,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.964,
              child: Stack(children: <Widget>[
                //blur
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
                              'Welcome',
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
                              'Verification is processed.',
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
                        SizedBox(height: size.height * 0.08),
                        const Center(
                          child: FaIcon(
                            FontAwesomeIcons.circleCheck,
                            color: colorf15,
                            size: 150,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Center(
                            child: Text(
                          'Please wait... It may takes about 1day...',
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w300,
                            textStyle: const TextStyle(color: colorf2),
                          ),
                        )),
                        SizedBox(height: size.height * 0.09),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: pricolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              fixedSize: Size(
                                  (size.width * 0.75), (size.height * 0.073)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/login');
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
                        ),
                        SizedBox(height: size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already have your account?',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                                letterSpacing: 1.0,
                                textStyle: const TextStyle(color: colorf2),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: Text(
                                ' Log In',
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  letterSpacing: 1.0,
                                  textStyle: const TextStyle(color: colorf2),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ]),
            )
          ],
        )));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class ValidPrint extends StatelessWidget {
  const ValidPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Please Fill in Your Details',
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          fontSize: 10.0,
          textStyle: const TextStyle(color: seccolor),
        ),
      ),
    );
  }
}
