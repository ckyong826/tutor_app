import 'package:flutter/material.dart';

import '../state/like_state.dart';

class CommentCard extends StatefulWidget {
  final String comment;
  const CommentCard({super.key, required this.comment});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            minHeight: 70,
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
                  backgroundImage: AssetImage('assets/defaultProfilePic.jpg'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
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
                        widget.comment,
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 15),
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
                              Icon(Icons.chat_bubble_outline_sharp, size: 15),
                              SizedBox(width: 5),
                              Text("15 discussions"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
