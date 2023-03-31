import 'package:flutter/material.dart';

class DetailedPostCard extends StatelessWidget {

  final String questionTitle;
  final String questionDescription;

  const DetailedPostCard({
    super.key, 
    required this.questionTitle,
    required this.questionDescription});


  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: Center(child: Text("Hi")),
    );
  }
}
