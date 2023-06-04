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
        height: size.height * 0.22,
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
                  fontSize: size.width * 0.065,
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
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/icons/medal2.png",
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/icons/college.png",
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/icons/award.png",
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/icons/recommendation.png",
                    height: size.width * 0.2,
                    width: size.width * 0.2,
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
