import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/question_stepper.dart';

class PostQuestion extends StatelessWidget {
  const PostQuestion({super.key});

  static const String _title = 'Post your question';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
              onPressed: () {
                // Navigator.pushNamed(context, '/');
                context.pop();
              },
            ),
            title: const Text(_title, style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Theme(
            data: ThemeData(
                colorScheme: ColorScheme.light(primary: Colors.green.shade200)),
            child: const Center(
              child: QuestionStepper(),
            ),
          )),
    );
  }
}
