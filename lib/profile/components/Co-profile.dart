import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'readUserData.dart';

class CoProfile extends StatefulWidget {
  final String userName;
  final String description;

  const CoProfile(
      {super.key, required this.userName, required this.description});

  @override
  State<CoProfile> createState() => _CoProfileState();
}

class _CoProfileState extends State<CoProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: size.width * 0.1, top: size.height * 0.07),
      width: size.width * 0.8,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          width: size.width * 0.25,
          height: size.width * 0.25,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
              image: NetworkImage(
                  'https://scontent-kul2-1.xx.fbcdn.net/v/t1.6435-9/197361547_10159720199988478_5859801409582680413_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeFAjmBw9MLKrZZ1dlIGB33_bGayiPen4JNsZrKI96fgk3ZlrpPttxJsaLRLftoxU0JlcLrgaDsUntmAFaly63J5&_nc_ohc=95NaLFmLLaAAX9UKl3m&_nc_ht=scontent-kul2-1.xx&oh=00_AfA4Xc5rMUpIc1UHo0H80fZTthbDdZ55hfhtOD0SkVaRTQ&oe=64991AB8'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        //UserName
        Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              widget.userName,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: const Color(0xff26273C),
                fontSize: size.height * 0.05,
              ),
            )),
        SizedBox(
          height: size.height * 0.003,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          width: size.width * 0.8,
          child: Text(
            widget.description,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              color: const Color(0xff666666),
              fontSize: size.height * 0.017,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        FractionallySizedBox(
          widthFactor: 1.0,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, size.height * 0.05),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: const Color(0xff6472D6),
              ),
              child: Text(
                "EDIT PROFILE",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffFFFFFF),
                  fontSize: size.height * 0.023,
                ),
              )),
        )
      ]),
    );
  }
}
