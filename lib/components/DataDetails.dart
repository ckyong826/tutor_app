import 'package:cloud_firestore/cloud_firestore.dart';

Future createUsername({required String name}) async {
  //Reference to document
  final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');

  final json = {
    'name': name,
    'age': 21,
    'birthday': DateTime(2001, 7, 28),
  };
  //Create document and write data to Firestore
  await docUser.set(json);
}
