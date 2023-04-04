import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/components/comment_box.dart';
import 'package:tutor_app/components/comment_card.dart';
import 'package:tutor_app/models/comments_likes_modal.dart';

import '../../state/like_state.dart';

class DetailedPost extends StatefulWidget {
  final String questionId;
  final String questionTitle;
  final String questionDescription;

  const DetailedPost(
      {super.key,
      required this.questionId,
      required this.questionTitle,
      required this.questionDescription});

  @override
  State<DetailedPost> createState() => _DetailedPostState();
}

class _DetailedPostState extends State<DetailedPost> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'View Post',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.black,
                ),
                onPressed: (() {
                  GoRouter.of(context).pop();
                }),
              ),
            ),
            body: Column(children: [
              const SizedBox(height: 15),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: double.infinity,
                ),
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 12, 0, 0),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            AssetImage('assets/defaultProfilePic.jpg'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              "tutor",
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 2, 8, 0),
                            child: Text(
                              widget.questionTitle,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 10, 2),
                            child: Text(
                              widget.questionDescription,
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 13),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Row(
                              children: <Widget>[
                                Row(
                                  children: const [
                                    LikeButton(),
                                  ],
                                ),
                                const SizedBox(width: 40),
                                Row(
                                  children: const [
                                    Icon(Icons.chat_bubble_outline_sharp,
                                        size: 15),
                                    SizedBox(width: 5),
                                    Text("15 discussions"),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // comment section
              const SizedBox(height: 30),

              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Discussion",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              // add column or sth to listview orelse cannot be displayed
              Expanded(
                child: StreamBuilder<List<Comment>>(
                    stream: readComments(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text(
                          'Something has went wrong',
                        ));
                      } else if (snapshot.hasData) {
                        final commentPosts = snapshot.data!;
                        return ListView(
                          children: commentPosts.map(buildCommentCard).toList(),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),

              CommentBox(
                  questionId: widget.questionId,
                  numComments: getCommentCount(widget.questionId)),
            ])));
  }

  Widget buildCommentCard(Comment userComment) => CommentCard(
        comment: userComment.comment,
      );

  Stream<List<Comment>> readComments() => FirebaseFirestore.instance
      .collection('questions')
      .doc(widget.questionId)
      .collection('comments')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Comment.fromJson(doc.data())).toList());
}

Future<int> getCommentCount(String questionID) async {
  final querySnapshot = await FirebaseFirestore.instance
      .collection('questions')
      .doc(questionID)
      .collection('comments')
      .get();

  final commentCount = querySnapshot.docs.length;
  return commentCount;
}
