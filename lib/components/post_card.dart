import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../state/like_state.dart';

class PostCard extends StatefulWidget {
  const PostCard(
      {super.key,
      required this.id,
      required this.title,
      required this.description});
  final String id;
  final String title;
  final String description;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).go(
                '/resources/forum/comment/${widget.id}/${widget.title}/${widget.description}');
          },
          child: Container(
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
                    backgroundImage: AssetImage('assets/defaultProfilePic.jpg'),
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
                          widget.title,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 8, 2),
                        child: Text(
                          widget.description,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                        child: Row(
                          children: <Widget>[
                            const LikeButton(),
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
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
