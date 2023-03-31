import 'package:flutter/material.dart';
import 'package:tutor_app/utils/find_tutor_components.dart';
import 'package:tutor_app/utils/size_config.dart';

import '../utils/home_components.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.fromLTRB(ScreenSize.horizontal! * 7,
                      ScreenSize.vertical! * 0.5, 0, 0),
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
                      Container(
                        // PURPLE CONTAINER
                        height: ScreenSize.vertical! * 25,
                        width: ScreenSize.horizontal! * 87,
                        decoration: BoxDecoration(
                            color: Color(0xff9F9DF3),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    ScreenSize.horizontal! * 6,
                                    ScreenSize.vertical! * 2,
                                    0,
                                    0),
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
                                height: ScreenSize.vertical! * 0.1,
                              ),
                              Container(
                                width: ScreenSize.horizontal! * 89,
                                height: ScreenSize.vertical! * 17,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(children: [
                                    SizedBox(
                                      width: ScreenSize.horizontal! * 6,
                                    ),
                                    UpcomingCard(
                                      subject: "Science",
                                      date: "8/3/2023",
                                      duration: "9:30-10:00",
                                    ),
                                    UpcomingCard(
                                      subject: "Add Maths",
                                      date: "8/3/2023",
                                      duration: "9:30-10:00",
                                    ),
                                    UpcomingCard(
                                      subject: "Chemistry",
                                      date: "8/3/2023",
                                      duration: "9:30-10:00",
                                    ),
                                    UpcomingCard(
                                      subject: "Biology",
                                      date: "8/3/2023",
                                      duration: "9:30-10:00",
                                    ),
                                    UpcomingCard(
                                      subject: "Sejarah",
                                      date: "8/3/2023",
                                      duration: "9:30-10:00",
                                    ),
                                    SizedBox(
                                      width: ScreenSize.horizontal! * 5,
                                    ),
                                  ]),
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
                SizedBox(
                  height: ScreenSize.vertical! * 3,
                ),
                SizedBox(
                  height: ScreenSize.vertical! * 13,
                  width: ScreenSize.horizontal! * 100,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
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
