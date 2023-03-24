import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future createStudent(Student student) async {
  //Reference to document
  final user = FirebaseAuth.instance.currentUser!;
  final email = user.email!;
  final docUser = FirebaseFirestore.instance.collection('student').doc(email);

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

  Student({
    this.id = '',
    required this.username,
    required this.level,
    required this.school,
    required this.academic,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'level': level,
        'school': school,
        'academic': academic,
      };
}

//Create Tutor
Future createTutor(Tutor tutor) async {
  //Reference to document
  final user = FirebaseAuth.instance.currentUser!;
  final email = user.email!;
  final docUser = FirebaseFirestore.instance.collection('tutor').doc(email);

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

  Tutor({
    this.id = '',
    required this.username,
    required this.level,
    required this.school,
    required this.academic,
    required this.name,
    required this.subject,
    required this.result,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'level': level,
        'school': school,
        'academic': academic,
        'Name': name,
        'subject': subject,
        'result': result,
      };
}
