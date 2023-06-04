import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Stat extends StatefulWidget {
  const Stat({super.key});

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
          width: size.width * 0.8,
          child: Column(
            children: [
              SizedBox(
                width: size.width * 0.8,
                child: Text(
                  'Statistics',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF191C32),
                    fontSize: size.width * 0.065,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF9F9DF3),
                    ),
                    width: size.width * 0.8,
                    height: size.height * 0.13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '31',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                              fontSize: size.width * 0.15,
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(0, -15, 0),
                            child: Text(
                              'sessions taught',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFFFFFF),
                                fontSize: size.width * 0.035,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '102',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                              fontSize: size.width * 0.15,
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(0, -15, 0),
                            child: Text(
                              'questions answered',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFFFFFF),
                                fontSize: size.width * 0.035,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
