import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tutor_app/utils/find_tutor_components.dart';
import 'package:tutor_app/utils/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/home_components.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

var studentData;

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getStudentData();
      setState(() {});
    });
    super.initState();
  }

  getStudentData() async {
    final DocumentSnapshot studentDoc =
        await FirebaseFirestore.instance.collection('students').doc("temporarilyIdOnlyLol").get();
    studentData = studentDoc.data();
  }

  @override
  Widget build(BuildContext context) {
    final sessionsData = FirebaseFirestore.instance.collection('sessions');

    ScreenSize().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(248, 255, 252, 252),
          image: DecorationImage(
            image: AssetImage("assets/home_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenSize.vertical! * 3,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      ScreenSize.horizontal! * 7, ScreenSize.vertical! * 0.5, 0, 0),
                  child: Text(
                    "Sessions",
                    style: TextStyle(
                      fontSize: (ScreenSize.vertical! * 3.5),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  //UPCOMING SECTION
                  width: ScreenSize.horizontal! * 100,
                  height: ScreenSize.vertical! * 29,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/sessions/upcoming_sessions');
                        },
                        child: Container(
                          // PURPLE CONTAINER
                          height: ScreenSize.vertical! * 25,
                          width: ScreenSize.horizontal! * 87,
                          decoration: BoxDecoration(
                              color: Color(0xff9F9DF3), borderRadius: BorderRadius.circular(30)),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  ScreenSize.horizontal! * 6, ScreenSize.vertical! * 2, 0, 0),
                              child: Text(
                                "Upcoming",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 254, 254, 254),
                                  fontSize: (ScreenSize.vertical! * 3.3),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenSize.vertical! * 0.5,
                            ),
                            Center(
                              child: Container(
                                width: ScreenSize.horizontal! * 85,
                                height: ScreenSize.vertical! * 17,
                                child: StreamBuilder(
                                  stream: sessionsData.snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List sessionsJoined = [];
                                      final sessionDocs = snapshot.data!.docs;

                                      // Filter out the sessions that the student joined
                                      for (int i = 0; i < sessionDocs.length; i++) {
                                        for (var sessionId in studentData["sessions"]) {
                                          if (sessionId == sessionDocs[i].id) {
                                            sessionsJoined.add(sessionDocs[i]);
                                          }
                                        }
                                      }

                                      return ListView.separated(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            final dateObj =
                                                DateTime.parse(sessionsJoined[index]["dateTime"]);
                                            final timeStartObj =
                                                DateTime.parse(sessionsJoined[index]["timeStart"]);
                                            final timeEndObj =
                                                DateTime.parse(sessionsJoined[index]["timeEnd"]);

                                            return Padding(
                                              padding: EdgeInsets.only(
                                                left: ScreenSize.horizontal! * 1.5,
                                                bottom: ScreenSize.horizontal! * 1,
                                              ),
                                              child: UpcomingCard(
                                                  subject: sessionsJoined[index]["subject"],
                                                  date: DateFormat("yyyy-MM-dd").format(dateObj),
                                                  duration:
                                                      "${DateFormat("hh:mm").format(timeStartObj)} - ${DateFormat("hh:mm").format(timeEndObj)}"),
                                            );
                                          },
                                          separatorBuilder: (context, index) => SizedBox(
                                                height: ScreenSize.horizontal! * 0,
                                              ),
                                          itemCount: sessionsJoined.length);
                                    } else {
                                      return SpinKitRing(
                                        color: Color(0xff9F9DF3),
                                        size: ScreenSize.vertical! * 10,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Positioned(
                        top: ScreenSize.vertical! * -2,
                        right: ScreenSize.vertical! * 5,
                        child: Image.asset(
                          'assets/calendar.png',
                          scale: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenSize.vertical! * 3,
                ),
                SizedBox(
                  height: ScreenSize.vertical! * 13,
                  width: ScreenSize.horizontal! * 100,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/sessions/findTutor');
                        },
                        child: Container(
                          height: ScreenSize.vertical! * 10,
                          width: ScreenSize.horizontal! * 87,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF9AB2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Find a Tutor",
                              style: TextStyle(
                                  fontSize: ScreenSize.vertical! * 3,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: ScreenSize.vertical! * 0.1),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 20,
                        child: Image.asset(
                          'assets/tutor.png',
                          scale: 1,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
