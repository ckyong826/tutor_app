import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../components/post_card.dart';
import '../../models/question_model.dart';

class QuestionPosting extends StatefulWidget {
  const QuestionPosting({super.key});

  @override
  State<QuestionPosting> createState() => _QuestionPostingState();
}

class _QuestionPostingState extends State<QuestionPosting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Question>>(
          stream: readQuestions(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something has went wrong');
            } else if (snapshot.hasData) {
              final questionPosts = snapshot.data!;
              return ListView(
                children: questionPosts.map(buildQuestionCard).toList(),
              );
              // questionPosts.map(Question question).toList();
              // return ResourcesCard(title: title);

            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go("/resources/forum/post");
        },
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent[100],
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget buildQuestionCard(Question question) => PostCard(
        title: question.title,
        description: question.description,
      );

  Stream<List<Question>> readQuestions() => FirebaseFirestore.instance
      .collection('questions')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Question.fromJson(doc.data())).toList());
}
