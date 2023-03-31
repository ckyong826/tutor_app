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
                                      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-9/31817390_1448910555255518_2611503638257860608_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=174925&_nc_ohc=g7MjU0O5fcQAX_KfQh_&_nc_oc=AQlCEcxjEpQ17T2596EF2lxNlIfzv_tlLTaFczvUEc5aEDgJEXFn7-NlEErIK6EVwm4jYj3cMvsj7fOJVx2hFu31&_nc_ht=scontent.fbki2-1.fna&oh=00_AfB_prGPm-4vvV8LjyNvdxRX8Hx8Kj4aHSMfMHHnhieh8A&oe=642AE9A8",
                                  name: "Mango Tan",
                                  subject: "Moral",
                                  stars: 1,
                                ),
                                TutorCard(
                                  imageUrl:
                                      "https://scontent.fbki2-1.fna.fbcdn.net/v/t39.30808-6/327723964_502352292055817_86326846560433633_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=biMVGfsYXngAX9J-UCG&_nc_ht=scontent.fbki2-1.fna&oh=00_AfAY4eeHl_KhNZW0_YxCj-adIxtMiyQr0FYUppFnVaPVVA&oe=6408016F",
                                  name: "Cgay",
                                  subject: "Fashion",
                                  stars: 1.6,
                                ),
                                TutorCard(
                                  imageUrl:
                                      "https://apicms.thestar.com.my/uploads/images/2022/01/19/1450137.jpg",
                                  name: "Lee Zii Jia",
                                  subject: "Football",
                                  stars: 5,
                                ),
                                TutorCard(
                                  imageUrl:
                                      "https://apicms.thestar.com.my/uploads/images/2022/01/19/1450137.jpg",
                                  name: "Lee Zii Jia",
                                  subject: "Football",
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
