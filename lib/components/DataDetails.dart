import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future createStudent(Student student) async {
  //Reference to document
  final user = FirebaseAuth.instance.currentUser!;
  final email = user.email!;
  final docUser = FirebaseFirestore.instance.collection('students').doc(email);

  student.id = docUser.id;
  final json = student.toJson();
  //Create document and write data to Firestore
  await docUser.set(json);
}

class Student {
  String id;

  final String username;
  final String? level;
  final String school;
  final String? academic;
  final List<String> sessions;

  Student({
    this.id = '',
    required this.username,
    required this.level,
    required this.school,
    required this.academic,
    required this.sessions,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'level': level,
        'school': school,
        'academic': academic,
        'sessions': sessions,
      };

  static Student fromJson(Map<String, dynamic> json) => Student(
      username: json['username'],
      level: json['level'],
      school: json['school'],
      academic: json['academic'],
      sessions: json['sessions']);
}

//Create Tutor
Future createTutor(Tutor tutor) async {
  //Reference to document
  final user = FirebaseAuth.instance.currentUser!;
  final email = user.email!;
  final docUser = FirebaseFirestore.instance.collection('tutors').doc(email);

  tutor.id = docUser.id;
  final json = tutor.toJson();
  //Create document and write data to Firestore
  await docUser.set(json);
}

class Tutor {
  String id;

  final String username;
  final String? level;
  final String school;
  final String? academic;
  final String name;
  final List<String> subject;
  final String result;
  final String bio;
  final String image;
  final String rules;
  final double stars;
  final List<String> sessions;

  Tutor({
    this.id = '',
    required this.username,
    required this.level,
    required this.school,
    required this.academic,
    required this.name,
    required this.subject,
    required this.result,
    required this.bio,
    required this.image,
    required this.rules,
    required this.stars,
    required this.sessions,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'level': level,
        'school': school,
        'academic': academic,
        'Name': name,
        'subject': subject,
        'result': result,
        'bio': bio,
        'image': image,
        'rules': rules,
        'stars': stars,
        'sessions': sessions,
      };
}
