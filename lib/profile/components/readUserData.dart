import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tutor_app/components/DataDetails.dart';
import 'package:google_fonts/google_fonts.dart';

class GetUserName extends StatelessWidget {
  const GetUserName({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    final email = user.email!;
    const Loading = "Loading";
    CollectionReference docStudent =
        FirebaseFirestore.instance.collection('students');
    final docTutor = FirebaseFirestore.instance.collection('tutors');

    return FutureBuilder<DocumentSnapshot>(
        future: docStudent.doc(email).get(),
        builder: ((BuildContext context,
            AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            Map<String, dynamic> data =
                streamSnapshot.data!.data() as Map<String, dynamic>;
            return Text(
              data['username'],
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: const Color(0xff26273C),
                fontSize: size.height * 0.05,
              ),
            );
          } else {
            return Text(Loading);
          }
        }));
  }
}
