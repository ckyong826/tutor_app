import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tutor {
  final String name;
  final String level;
  final String image;
  final String subject;
  final String uni;
  final double stars;

  Tutor({
    required this.name,
    required this.level,
    required this.image,
    required this.subject,
    required this.uni,
    required this.stars,
  });

  Future addTutor() async {
    return FirebaseFirestore.instance.collection('tutors').add({
      "name": name,
      "level": level,
      "image": image,
      "subject": subject,
      "uni": uni,
      "stars": stars,
    });
  }
}
