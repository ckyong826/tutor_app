import 'package:flutter/material.dart';
import 'package:tutor_app/utils/size_config.dart';

class TutorCard extends StatefulWidget {
  final String? imageUrl;
  final String? name;
  String subject;
  double stars;
  TutorCard({
    required this.imageUrl,
    required this.name,
    required this.subject,
    required this.stars,
  });

  @override
  State<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(15, 0, 0, 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        width: 114,
        height: 185,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage("${widget.imageUrl}"),
            ),
            Text(
              "${widget.name}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.subject,
                style: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${widget.stars}"),
                const SizedBox(
                  width: 3,
                ),
                Image.asset(
                  'assets/star2.png',
                  scale: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}

class UpcomingCard extends StatefulWidget {
  final String subject;
  final String date;
  final String duration;

  UpcomingCard(
      {super.key,
      required this.subject,
      required this.date,
      required this.duration});

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        height: ScreenSize.vertical! * 15,
        width: ScreenSize.horizontal! * 33,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff66B6FF),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 3,
                offset: Offset(0, 2),
              )
            ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.subject,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenSize.vertical! * 2.9,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.date,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      widget.duration,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

class ResourcesCard extends StatelessWidget {
  final String title;
  final String tutor;
  final int likes;
  final int downloads;

  const ResourcesCard(
      {super.key,
      required this.title,
      required this.tutor,
      required this.likes,
      required this.downloads});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 110,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 3, 0, 0),
            child: Text(
              "by $tutor",
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
            child: Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite, size: 15),
                    Text("${likes} Likes")
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                Row(
                  children: [
                    const Icon(Icons.download, size: 20),
                    Text("${downloads} downloads"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
