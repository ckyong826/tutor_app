import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tutor_app/models/comments_likes_modal.dart';

class CommentBox extends StatefulWidget {
  final String questionId;
  const CommentBox(
      {super.key, required this.questionId, required Future<int> numComments});

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  final _comments = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
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
                        onPressed: () {},
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
                              onPressed: () async {
                                final comment = _comments.text;
                                final questionID = widget.questionId;
                                await createComment(
                                    questionID: questionID, comment: comment);
                                // clear the textarea
                                _comments.clear();
                              },
                              color: Colors.white,
                            ),
                          ))
                      // splashRadius: 20,
                      )),
            ),
          ),
        ),
      ),
    ]);
  }

  // create and post comment to firebase
  Future createComment(
      {required String questionID, required String comment}) async {
    final docComment = FirebaseFirestore.instance
        .collection('questions')
        .doc(questionID)
        .collection('comments')
        .doc();

    // create data using the reference
    final commentPost = Comment(
      id: docComment.id,
      comment: comment,
    );
    final json = commentPost.toJson();

    // create document and write daya to Firebase
    await docComment.set(json);
  }

  // read from firebase
  Future<List<String>> readQuestionIds() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('questions').get();

    final ids = querySnapshot.docs.map((doc) => doc.id).toList();
    return ids;
  }
}
