import 'package:flutter/material.dart';
import '../utils/home_components.dart';
import '../utils/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(250, 226, 223, 223),
          image: DecorationImage(
            image: AssetImage("assets/home_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 0, 20),
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Padding(
                  // PURPLE CONTAINER
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Container(
                    width: 400,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff9F9DF3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                          child: Text(
                            "Top tutors of the week",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                TutorCard(
                                  imageUrl:
                                      "https://hips.hearstapps.com/hmg-prod/images/gettyimages-3091504.jpg",
                                  name: "Lai Ze Min",
                                  subject: "Add Maths",
                                  stars: 5,
                                ),
                                TutorCard(
                                  imageUrl:
                                      "https://images.pexels.com/photos/277012/pexels-photo-277012.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                  name: "Mango Tan",
                                  subject: "Moral",
                                  stars: 1,
                                ),
                                TutorCard(
                                  imageUrl:
                                      "https://images.pexels.com/photos/16791971/pexels-photo-16791971/free-photo-of-city-road-fashion-people.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                  name: "Ck",
                                  subject: "Science",
                                  stars: 1.6,
                                ),
                                TutorCard(
                                  imageUrl:
                                      "https://images.pexels.com/photos/698547/pexels-photo-698547.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                  name: "Lee Zi Jia",
                                  subject: "Chemistry",
                                  stars: 5,
                                ),
                                TutorCard(
                                  imageUrl:
                                      "https://images.pexels.com/photos/1006073/pexels-photo-1006073.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                  name: "Cherry",
                                  subject: "Biology",
                                  stars: 5,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
                  child: Text(
                    "Upcoming Sessions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  //UPCOMING SESSIONS
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: SizedBox(
                    width: ScreenSize.horizontal! * 100,
                    height: ScreenSize.vertical! * 20,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
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
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(186, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 15),
                        Text(
                          "Top Resources This Week",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 15),
                        ResourcesCard(
                            title: "SPM A++ Chemistry Notes",
                            tutor: "Cikgu Zemin",
                            likes: 20,
                            downloads: 5),
                        SizedBox(height: 15),
                        ResourcesCard(
                            title: "Add Maths Intensive Notes",
                            tutor: "Cikgu Zemin",
                            likes: 16,
                            downloads: 2),
                        SizedBox(height: 15),
                        ResourcesCard(
                            title: "SPM A++ Chemistry Notes",
                            tutor: "Cikgu Zemin",
                            likes: 200,
                            downloads: 200),
                        SizedBox(height: 15),
                        ResourcesCard(
                            title: "SPM A++ Chemistry Notes",
                            tutor: "Cikgu Zemin",
                            likes: 200,
                            downloads: 200),
                        SizedBox(height: 15),
                        ResourcesCard(
                            title: "SPM A++ Chemistry Notes",
                            tutor: "Cikgu Zemin",
                            likes: 200,
                            downloads: 200),
                        SizedBox(height: 15),
                      ],
                    ),
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
