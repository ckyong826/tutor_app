import 'package:flutter/material.dart';
import '../models/session.dart';
import '../utils/size_config.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PopUpBookingCard extends StatefulWidget {
  final Session session;
  final String tutorRules;
  final String tutorImage;
  final String tutorName;

  const PopUpBookingCard({
    super.key,
    required this.session,
    required this.tutorRules,
    required this.tutorImage,
    required this.tutorName,
  });

  @override
  State<PopUpBookingCard> createState() => _PopUpBookingCardState();
}

class _PopUpBookingCardState extends State<PopUpBookingCard> {
  late int numParticipants = widget.session.participants.length;
  @override
  Widget build(BuildContext context) {
    final String userID = "temporarilyIdOnlyLol";
    final timeStart = DateFormat("h:mma").format(widget.session.timeStart);
    final timeEnd = DateFormat("h:mma").format(widget.session.timeEnd);
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: ScreenSize.horizontal! * 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.3),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(widget.tutorImage),
                    radius: ScreenSize.vertical! * 2.5,
                  ),
                  title: Text(
                    widget.tutorName,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.info),
                  subtitle: Text("Rules"),
                ),
                Padding(
                  padding: EdgeInsets.all(ScreenSize.horizontal! * 5),
                  child: Text(
                    widget.tutorRules,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenSize.vertical! * 2,
          ),
          Container(
            width: ScreenSize.horizontal! * 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.3),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(ScreenSize.horizontal! * 3),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("${numParticipants} / ${widget.session.maxParticipants}"),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text("${timeStart} - ${timeEnd}"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ScreenSize.vertical! * 2,
          ),
          Container(
            width: ScreenSize.horizontal! * 30,
            child: ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('sessions').doc(widget.session.id).update({
                  "participants": FieldValue.arrayUnion([userID])
                });

                // Pop three times until FindTutorPage
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff9F9DF3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "JOIN",
                style: TextStyle(fontSize: ScreenSize.horizontal! * 5),
              ),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

class AvailableSessionCard extends StatefulWidget {
  final String tutorName;
  final Session session;
  final DateTime selectDay;

  const AvailableSessionCard({
    super.key,
    required this.session,
    required this.selectDay,
    required this.tutorName,
  });

  @override
  State<AvailableSessionCard> createState() => AvailableSessionCardState();
}

class AvailableSessionCardState extends State<AvailableSessionCard> {
  @override
  Widget build(BuildContext context) {
    final timeStart = DateFormat("h:mma").format(widget.session.timeStart);
    final timeEnd = DateFormat("h:mma").format(widget.session.timeEnd);
    ScreenSize().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, ScreenSize.vertical! * 2),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.session.title,
              style: TextStyle(fontSize: ScreenSize.horizontal! * 4.3),
            ),
            subtitle: Text("by ${widget.tutorName}"),
            trailing: Text("${timeStart} - ${timeEnd}"),
          ),
        ],
      ),
    );
  }
}
