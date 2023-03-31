import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tutor_app/utils/size_config.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// Subject dropdown menu
class LevelDropdown extends StatefulWidget {
  List<String> level;
  String dropdownValue;
  final Function(String) onLevelChanged;

  LevelDropdown(
      {super.key,
      required this.level,
      required this.dropdownValue,
      required this.onLevelChanged});

  @override
  State<LevelDropdown> createState() => Level_DropdownState();
}

class Level_DropdownState extends State<LevelDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Color.fromARGB(155, 255, 255, 255), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Color.fromARGB(1, 255, 255, 255), width: 2),
          ),
          filled: true,
          fillColor: const Color.fromARGB(155, 255, 255, 255),
          contentPadding: const EdgeInsets.all(10)),
      isExpanded: true,
      value: widget.dropdownValue,
      items: widget.level.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(
            child: Text(
              value,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        widget.onLevelChanged(value!);
      },
    );
  }
}

// Subject selection
class SubjectSelection extends StatelessWidget {
  final List subjects;
  final String subjectSelected;
  final Function(String) onChanged;
  SubjectSelection(
      {super.key,
      required this.subjects,
      required this.subjectSelected,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Container(
      width: ScreenSize.horizontal! * 100,
      height: ScreenSize.vertical! * 5,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: subjects.map(
          (value) {
            return TextButton(
              onPressed: () {
                onChanged(value);
              },
              child: (subjectSelected == value)
                  ? Text(
                      value,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenSize.vertical! * 2),
                    )
                  : Text(
                      value,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenSize.vertical! * 2),
                    ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class FindTutorCard extends StatefulWidget {
  final String tutorName;
  final String tutorImage;
  final String tutorUni;
  final double tutorStars;
  final String tutorSubject;
  final String tutorBio;
  final String id;
  final String tutorLevel;
  final bool bookTutorButton;
  final List tutorSessionIDs;
  final String tutorRules;
  const FindTutorCard({
    super.key,
    required this.tutorName,
    required this.tutorUni,
    required this.tutorImage,
    required this.tutorStars,
    required this.tutorSubject,
    required this.tutorBio,
    required this.id,
    required this.tutorLevel,
    required this.bookTutorButton,
    required this.tutorSessionIDs,
    required this.tutorRules,
  });

  @override
  State<FindTutorCard> createState() => _FindTutorCardState();
}

class _FindTutorCardState extends State<FindTutorCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.tutorImage.runtimeType);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          builder: (context) {
            return Container(
              height: ScreenSize.vertical! * 40,
              margin: EdgeInsets.all(ScreenSize.horizontal! * 5),
              child: Column(
                children: [
                  // TOP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Profile pic
                      CircleAvatar(
                        foregroundImage: NetworkImage(widget.tutorImage),
                        radius: ScreenSize.vertical! * 6,
                      ),
                      // Name, uni, subjects

                      Expanded(
                        child: Container(
                          margin:
                              EdgeInsets.only(left: ScreenSize.horizontal! * 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.tutorName,
                                style: TextStyle(
                                  fontSize: ScreenSize.vertical! * 3,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                widget.tutorUni,
                                style: TextStyle(
                                  fontSize: ScreenSize.vertical! * 2,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(
                                height: ScreenSize.vertical! * 1.5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 140, 211, 128),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    widget.tutorSubject,
                                    style: TextStyle(
                                      fontSize: ScreenSize.vertical! * 2,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Rating

                      Column(
                        children: [
                          Text(
                            "${widget.tutorStars}",
                            style: TextStyle(
                              fontSize: ScreenSize.vertical! * 5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Rating",
                            style: TextStyle(
                              fontSize: ScreenSize.vertical! * 2.5,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenSize.vertical! * 2,
                  ),
                  // Description
                  Text(
                    widget.tutorBio,
                    style: TextStyle(
                        fontSize: ScreenSize.vertical! * 2,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 144, 141, 141)),
                  ),
                  SizedBox(
                    height: ScreenSize.vertical! * 5,
                  ),
                  // Book tutor button
                  // Check if bookTutorButton is true or false
                  widget.bookTutorButton
                      // If true, show button
                      ? Container(
                          height: ScreenSize.vertical! * 5,
                          width: ScreenSize.horizontal! * 90,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff9F9DF3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/book_session',
                                  arguments: {
                                    "tutorName": widget.tutorName,
                                    "tutorUni": widget.tutorUni,
                                    "tutorStars": widget.tutorStars,
                                    "tutorImage": widget.tutorImage,
                                    "tutorSubject": widget.tutorSubject,
                                    "tutorBio": widget.tutorBio,
                                    "tutorID": widget.id,
                                    "tutorLevel": widget.tutorLevel,
                                    "tutorSessionsIDs": widget.tutorSessionIDs,
                                    "tutorRules": widget.tutorRules,
                                  });
                            },
                            child: Text(
                              "BOOK TUTOR",
                              style: TextStyle(
                                fontSize: ScreenSize.vertical! * 2.5,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        )
                      // If false, show empty container
                      : Container(),
                  // Reviews
                ],
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(widget.tutorImage),
            radius: ScreenSize.vertical! * 3,
          ),
          title: Text(widget.tutorName),
          subtitle: Text(widget.tutorUni),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${widget.tutorStars}"),
              SizedBox(
                width: ScreenSize.horizontal! * 1,
              ),
              Image.asset(
                "assets/star2.png",
                height: ScreenSize.horizontal! * 5,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
