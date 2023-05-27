import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CoBadge extends StatefulWidget {
  const CoBadge({super.key});

  @override
  State<CoBadge> createState() => _CoBadgeState();
}

class _CoBadgeState extends State<CoBadge> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.21,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Text(
                'Badges',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF191C32),
                  fontSize: size.height * 0.03,
                ),
              ),
            ),
            Container(
              height: size.height * 0.15,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(
                    "assets/icons/medal.png",
                    height: size.height * 0.01,
                    width: size.height * 0.1,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/icons/medal2.png",
                    height: size.height * 0.1,
                    width: size.height * 0.1,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/icons/college.png",
                    height: size.height * 0.1,
                    width: size.height * 0.1,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/icons/award.png",
                    height: size.height * 0.1,
                    width: size.height * 0.1,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/icons/recommendation.png",
                    height: size.height * 0.1,
                    width: size.height * 0.1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
