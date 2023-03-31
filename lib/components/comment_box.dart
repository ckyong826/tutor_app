import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatefulWidget {
  const CommentBox({super.key});

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  final _comments = TextEditingController();

  Future<void> addComment(String questionId) async {
    final commentRef = FirebaseFirestore.instance
        .collection('questions')
        .doc(questionId)
        .collection('comments')
        .doc();

    // Add the comment data to Firestore
    await commentRef.set({
      // 'comment': comment,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 340, // set the width here
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextFormField(
                    controller: _comments,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.attach_file),
                          onPressed: () {
                            // final comments = _comments.text;

                            // createComment(comments: comments);
                          },
                        ),
                        suffixIcon: Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepPurpleAccent[100],
                            ),
                            child: Center(
                              child: IconButton(
                                icon: const Icon(Icons.arrow_upward),
                                onPressed: () {},
                                color: Colors.white,
                              ),
                            ))
                        // splashRadius: 20,
                        )),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  // Future createComment({required String comment}) async{

  // }
}
