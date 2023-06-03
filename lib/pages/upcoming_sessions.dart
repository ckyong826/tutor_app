import 'package:flutter/material.dart';
import 'package:tutor_app/utils/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import '../utils/home_components.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/session.dart';
import 'package:tutor_app/utils/book_session_components.dart';

var studentData;
var tutorData;

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({super.key});

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  Map<DateTime, List<Session>> bookedSessions = {};
  List<Session> _getSessionsfromDay(DateTime date) {
    return bookedSessions[date] ?? [];
  }

  DateTime selectDay = DateTime.now();

  bool checkDuplicateSessions(DateTime tempDateTime, String tutorSessionID) {
    return bookedSessions[tempDateTime]!.any((session) => session.id == tutorSessionID);
  }

  bool alreadyBooked(List DBparticipants, List<Session> bookedSessionsList) {
    for (int i = 0; i < bookedSessionsList.length; i++) {
      if (DBparticipants.contains(bookedSessionsList[i].participants)) {
        return true;
      }
    }
    return false;
  }

  @override
  // Get student data and all of tutors data
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getStudentData();
      await getTutorData();
      setState(() {});
    });
    super.initState();
  }

  getStudentData() async {
    final DocumentSnapshot studentDoc =
        await FirebaseFirestore.instance.collection('students').doc("temporarilyIdOnlyLol").get();
    studentData = studentDoc.data();
  }

  getTutorData() async {
    QuerySnapshot tutorDoc = await FirebaseFirestore.instance.collection('tutors').get();
    tutorData = tutorDoc.docs;
  }

  @override
  Widget build(BuildContext context) {
    final sessionsData = FirebaseFirestore.instance.collection('sessions');
    ScreenSize().init(context);

    Future<void> showDialogAndRebuild(Session session) async {
      await showDialog(
        context: context,
        builder: (context) => PopUpBookingCard(
          session: session,
          tutorRules: session.tutor["rules"],
          tutorImage: session.tutor["image"],
          tutorName: session.tutor["name"],
          cardType: "upcoming_page",
        ),
      ).then((context) => setState(() {}));
    }

    return Scaffold(
        backgroundColor: Color(0xffF2F3F7),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, size: ScreenSize.horizontal! * 8),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      ScreenSize.horizontal! * 7, ScreenSize.vertical! * 0.5, 0, 0),
                  child: Text(
                    "Upcoming",
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
                      Container(
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
                                  if (snapshot.hasData &&
                                      studentData != null &&
                                      tutorData != null) {
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
                                      color: Color(0xff66B6FF),
                                      size: ScreenSize.vertical! * 10,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ]),
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
                StreamBuilder(
                  stream: sessionsData.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && studentData != null && tutorData != null) {
                      final tutorSession = snapshot.data!.docs;

                      for (int i = 0; i < studentData["sessions"].length; i++) {
                        for (int k = 0; k < tutorSession.length; k++) {
                          if (studentData["sessions"][i] == tutorSession[k].id) {
                            DateTime tempDateTime = DateTime.parse(tutorSession[k]["dateTime"]);
                            DateTime timeStart = DateTime.parse(tutorSession[k]["timeStart"]);
                            DateTime timeEnd = DateTime.parse(tutorSession[k]["timeEnd"]);

                            var currentTutor;

                            for (var tutor in tutorData) {
                              if (tutor.id == tutorSession[k]["tutorID"]) {
                                currentTutor = tutor.data();
                              }
                            }

                            // print(tutorData["name"]);
                            if (bookedSessions[tempDateTime] != null &&
                                !checkDuplicateSessions(tempDateTime, tutorSession[k].id)) {
                              bookedSessions[tempDateTime]!.add(
                                Session(
                                  id: tutorSession[k].id,
                                  dateTime: tempDateTime,
                                  maxParticipants: tutorSession[k]["maxParticipants"],
                                  participants: tutorSession[k]["participants"],
                                  title: tutorSession[k]["title"],
                                  timeStart: timeStart,
                                  timeEnd: timeEnd,
                                  tutor: currentTutor,
                                ),
                              );
                            } else if (bookedSessions[tempDateTime] == null) {
                              bookedSessions[tempDateTime] = [
                                Session(
                                  id: tutorSession[k].id,
                                  dateTime: tempDateTime,
                                  maxParticipants: tutorSession[k]["maxParticipants"],
                                  participants: tutorSession[k]["participants"],
                                  title: tutorSession[k]["title"],
                                  timeStart: timeStart,
                                  timeEnd: timeEnd,
                                  tutor: currentTutor,
                                )
                              ];
                            } else if (bookedSessions[tempDateTime] != null &&
                                alreadyBooked(tutorSession[k]["participants"],
                                    bookedSessions[tempDateTime]!)) {}
                          }
                        }
                      }

                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenSize.horizontal! * 6,
                            vertical: ScreenSize.vertical! * 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(ScreenSize.horizontal! * 3),
                          child: TableCalendar(
                            availableGestures: AvailableGestures.none,
                            focusedDay: DateTime.now(),
                            firstDay: DateTime.utc(2023, 3, 1),
                            lastDay: DateTime.utc(2024, 3, 1),
                            headerStyle:
                                const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                            selectedDayPredicate: (day) => isSameDay(day, selectDay),
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                selectDay = selectedDay;
                                print(selectDay);
                              });
                            },
                            eventLoader: _getSessionsfromDay,
                            calendarStyle: const CalendarStyle(
                              selectedDecoration: BoxDecoration(
                                color: Color(0xff5FC88F),
                                shape: BoxShape.circle,
                              ),
                              todayDecoration: BoxDecoration(
                                color: Color(0xff9F9DF3),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SpinKitRing(
                        color: Color(0xff9F9DF3),
                        size: ScreenSize.vertical! * 10,
                      );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: ScreenSize.horizontal! * 6),
                  child: Text(
                    "Booked Sessions",
                    style: TextStyle(
                      fontSize: ScreenSize.horizontal! * 5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenSize.vertical! * 2,
                ),
                ..._getSessionsfromDay(selectDay).map((Session session) {
                  return GestureDetector(
                    onTap: () => showDialogAndRebuild(session),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.horizontal! * 6,
                      ),
                      child: AvailableSessionCard(
                        session: session,
                        selectDay: selectDay,
                        tutorName: session.tutor["name"],
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: ScreenSize.vertical! * 3,
                ),
              ],
            ),
          ),
        ));
  }
}
