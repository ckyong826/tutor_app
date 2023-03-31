import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/comment_box.dart';

class DetailedPost extends StatefulWidget {
  final String questionTitle;
  final String questionDescription;

  const DetailedPost(
      {super.key,
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
                context.pop();
              }),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 15),
              Expanded(
                child: Container(
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Row(
                              children: <Widget>[
                                Row(
                                  children: const [
                                    Icon(Icons.favorite_border_outlined, size: 15),
                                    SizedBox(width: 5),
                                    // Text("${likes} Likes"),
                                    Text("500 Likes"),
                                  ],
                                ),
                                const SizedBox(width: 40),
                                Row(
                                  children: const [
                                    Icon(Icons.chat_bubble_outline_sharp, size: 15),
                                    SizedBox(width: 5),
                                    Text("15 discussions"),
                                  ],
                                ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
        // comment section
        const SizedBox(height: 15),
        
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
        const CommentBox(),
       ]
      )
    )
   ); 
  }
}
