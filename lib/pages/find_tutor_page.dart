import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tutor_app/resources/tutor_model.dart';
import 'package:tutor_app/utils/find_tutor_components.dart';
import 'package:tutor_app/utils/size_config.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FindTutorPage extends StatefulWidget {
  const FindTutorPage({super.key});

  @override
  State<FindTutorPage> createState() => _FindTutorPageState();
}

class _FindTutorPageState extends State<FindTutorPage> {
  // Initialize subjects list
  List subjects = [];
  late String subjectSelected = subjects.first;

  List<String> level = ["SPM", "IGCSE", "PT3"];

  late String dropdownValue = level.first;

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    // Assign subjectsData and tutorData to firebase collections
    final subjectsData = FirebaseFirestore.instance.collection('levels');
    final tutorData = FirebaseFirestore.instance.collection('tutors');

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(250, 226, 223, 223),
          image: DecorationImage(
            image: AssetImage("assets/find_tutor_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  ScreenSize.horizontal! * 5,
                  ScreenSize.vertical! * 5,
                  ScreenSize.horizontal! * 5,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ElevatedButton(
                    //     onPressed: () {
                    //       tutorData.add({
                    //         "bio":
                    //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    //         "stars": 4.3,
                    //         "image":
                    //             "https://www.nme.com/wp-content/uploads/2022/07/g-dragon-elvis-presley-cant-help-falling-in-love-baz-luhrmann-collaboration-cover.jpg",
                    //         "level": "SPM",
                    //         "name": "LaiZM",
                    //         "rules":
                    //             "Come in 5 minutes earlier. Ask questions one by one. Inform me earlier if you are unable to attend",
                    //         "subject": "Physics",
                    //         "uni": "UMS",
                    //         "sessions": ["kvVl9pTHOQO0ZXUYHGhf"],
                    //       });
                    //     },
                    //     child: Text("Upload tutor")),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       FirebaseFirestore.instance.collection("sessions").add({
                    //         "subject": "Physics",
                    //         "dateTime": "2023-06-4 00:00:00.000Z",
                    //         "maxParticipants": 5,
                    //         "participants": ["ahsdjkfhasdfj", "asdkjfasjdf", "tuiweiwuiwo"],
                    //         "timeEnd": "2023-03-15 16:00:00.000Z",
                    //         "timeStart": "2023-03-15 14:00:00.000Z",
                    //         "title": "intensive revision with me!"
                    //       });
                    //     },
                    //     child: Text("Upload session")),

                    //FIND TUTOR TITLE
                    Text(
                      "Find a tutor",
                      style: TextStyle(
                          fontSize: ScreenSize.vertical! * 4, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: ScreenSize.vertical! * 2,
                    ),

                    // LEVEL SELECTION INPUT FIELD
                    LevelDropdown(
                      level: level,
                      dropdownValue: dropdownValue,
                      // When level dropdown value is changed, setState dropdownValue
                      onLevelChanged: (String value) {
                        setState(() {
                          dropdownValue = value;
                          subjectSelected = "Maths";
                        });
                      },
                    ),
                  ],
                ),
              ),

              // LIST OF TUTORS
              Container(
                padding: EdgeInsets.all(ScreenSize.horizontal! * 5),
                width: ScreenSize.horizontal! * 100,
                height: ScreenSize.vertical! * 70,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(155, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40), topLeft: Radius.circular(40))),
                child: Column(
                  children: [
                    //Subjects
                    StreamBuilder(
                      stream: subjectsData.snapshots(),
                      builder: (context, snapshot) {
                        // If there is data in subjectsData snapshot
                        if (snapshot.hasData) {
                          // Get all documents of subjects in Firebase
                          final subjectsDocs = snapshot.data!.docs;

                          // Find the suitable document of subjects according to
                          // level selected
                          for (int i = 0; i < subjectsDocs.length; i++) {
                            if (subjectsDocs[i]["level"] == dropdownValue) {
                              // Assign all of the subjectsData into subjects List
                              subjects = subjectsDocs[i]['subjects'];
                            }
                          }
                          return SubjectSelection(
                            subjects: subjects,
                            subjectSelected: subjectSelected,
                            // When subject button is pressed, assign the value
                            // to subjectSelected variable
                            onChanged: (String value) {
                              setState(
                                () {
                                  subjectSelected = value;
                                },
                              );
                            },
                          );
                        } else {
                          return SpinKitRing(
                            color: Color(0xff9F9DF3),
                            size: ScreenSize.vertical! * 10,
                          );
                          ;
                        }
                      },
                    ),
                    SizedBox(
                      height: ScreenSize.vertical! * 2,
                    ),
                    //Tutors
                    StreamBuilder(
                      stream: tutorData.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final tutorDocs = snapshot.data!.docs;

                          final List filteredTutors = [];
                          // Filter tutors by subject and store in filteredTutors
                          for (int i = 0; i < tutorDocs.length; i++) {
                            // If tutor subject and level is matching
                            if (tutorDocs[i]["subject"] == subjectSelected &&
                                tutorDocs[i]["level"] == dropdownValue) {
                              // Add the tutor to a List of filteredTutors
                              filteredTutors.add(tutorDocs[i]);
                            }
                          }
                          return Expanded(
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  // Loop through filteredTutors List
                                  final currentTutor = filteredTutors[index];

                                  return FindTutorCard(
                                    tutorName: currentTutor["name"],
                                    tutorUni: currentTutor["uni"],
                                    tutorImage: currentTutor["image"],
                                    tutorStars: double.parse(
                                      currentTutor["stars"].toString(),
                                    ),
                                    tutorSubject: currentTutor["subject"],
                                    tutorBio: currentTutor["bio"],
                                    id: currentTutor.id,
                                    tutorLevel: dropdownValue,
                                    tutorSessionIDs: currentTutor["sessions"],
                                    tutorRules: currentTutor["rules"],
                                    bookTutorButton: true,
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      height: ScreenSize.vertical! * 2,
                                    ),
                                itemCount: filteredTutors.length),
                          );
                        } else {
                          return SpinKitRing(
                            color: Color(0xff9F9DF3),
                            size: ScreenSize.vertical! * 10,
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
