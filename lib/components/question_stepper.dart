import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../models/question_model.dart';

class QuestionStepper extends StatefulWidget {
  const QuestionStepper({super.key});

  @override
  State<QuestionStepper> createState() => _QuestionStepperState();
}

class _QuestionStepperState extends State<QuestionStepper> {
  int _index = 0;

  final _title = TextEditingController();
  final _description = TextEditingController();
  String? selectedLevel;
  String? selectedSubject;
  String? selectedPreference;

  var questionLevels = ['PT3', 'SPM', 'UEC', 'IGSCE'];
  var questionSubject = [
    'Bahasa Melayu',
    'English',
    'Sejarah',
    'Mathematics',
    'Biology',
    'Physics',
    'Chemistry',
    'Additional Mathematics'
  ];
  var questionPreference = [
    'Peer discussion',
    'Tutor discussion',
    'Tutor video explanation',
  ];

  // create a storage instance
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _image;
  final ImagePicker _picker = ImagePicker();

  // to select pic from gallery
  Future imgFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
        uploadImage();
      }
    });
  }

  // to select pic from camera
  Future imgFromCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _image = File(image.path);
        uploadImage();
      }
    });
  }

  // to upload image
  Future uploadImage() async {
    if (_image == null) return;
    final fileName = File(_image!.path);
    final destination = 'questionPic/$fileName';

    final ref = firebase_storage.FirebaseStorage.instance
        .ref(destination)
        .child('questionPicture/');

    await ref.putFile(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: _index,

        // when continue button is tapped
        onStepContinue: () {
          final isLastStep = _index == getSteps().length - 1;

          if (isLastStep) {
            // send data to server
          } else {
            setState(() => _index += 1);
          }
        },

        // when step buttom is tapped
        onStepTapped: (step) => setState(() {
              _index = step;
            }),

        // when cancel button is tapped
        onStepCancel: () {
          _index == 0
              ? null
              : setState(() {
                  _index -= 1;
                });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          final isLastStep = _index ==
              getSteps().length - 1; // to get the last step in stepper
          return Row(
            children: <Widget>[
              if (_index != 0)
                Expanded(
                    child: ElevatedButton(
                        onPressed: details.onStepCancel,
                        child: const Text("Back"))),
              const SizedBox(width: 12),
              if (!isLastStep)
                Expanded(
                    child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: const Text('Next'))),
              if (isLastStep)
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          createQuestion(
                              title: _title.text,
                              description: _description.text,
                              questionLevel: selectedLevel!,
                              questionSubject: selectedSubject!,
                              solvingPreference: selectedPreference!);

                          // direct back to question posting page
                          Navigator.pushNamed(context, '/');
                        },
                        child: const Text('Submit'))),
            ],
          );
        });
  }

  Future createQuestion(
      {required String title,
      required String description,
      required String questionLevel,
      required String questionSubject,
      required String solvingPreference}) async {
    // reference to document
    final docQuestion =
        FirebaseFirestore.instance.collection('questions').doc();

    // create data using the reference
    final question = Question(
        id: docQuestion.id,
        title: title,
        description: description,
        questionLevel: questionLevel,
        questionSubject: questionSubject,
        solvingPreference: solvingPreference);
    final json = question.toJson();

    // create document and write daya to Firebase
    await docQuestion.set(json);

    
  }

  List<Step> getSteps() => [
        Step(
          state: _index > 0 ? StepState.complete : StepState.indexed,
          isActive: _index >=
              0, //to check if our current step is active (step is coloured)

          title: const Text('description'),
          content: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              TextFormField(
                controller: _title,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, // text label is always floated above the text form
                  hintText: 'Give your question a short title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  )),
                ),
              ),
              const SizedBox(height: 70),
              TextFormField(
                controller: _description,
                keyboardType: TextInputType.multiline,
                minLines: 4,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Tell us more about your question',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
              const SizedBox(height: 50),
              DottedBorder(
                color: Colors.grey,
                borderType: BorderType.RRect,
                radius: const Radius.circular(15),
                dashPattern: const [2, 5],
                strokeWidth: 2,
                strokeCap: StrokeCap.round,
                child: SizedBox(
                  height: 125,
                  width: 400,
                  child: GestureDetector(
                    onTap: () => _showPicker(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _image != null
                            ? Image.file(
                                _image!,
                                width: 50,
                                height: 50,
                              )
                            : const Image(
                                image: AssetImage('assets/uploadImage.png'),
                                height: 50,
                              ),
                        const Text(
                          'Upload Image',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
        Step(
          state: _index > 1 ? StepState.complete : StepState.indexed,
          isActive: _index >= 1,
          title: const Text('category'),
          content: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Question Level',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Choose the level of your question',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      )),
                ),
                // initial value
                value: selectedLevel,

                // arrow icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // array list of items
                items: questionLevels.map((String level) {
                  return DropdownMenuItem(
                    value: level,
                    child: Text(level),
                  );
                }).toList(),

                onChanged: (String? newLevel) => setState(() {
                  selectedLevel = newLevel ?? '';
                }),
              ),
              const SizedBox(height: 70),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Choose the subject of your question',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),

                // initial value of the dropdown
                value: selectedSubject,

                icon: const Icon(Icons.keyboard_arrow_down),
                menuMaxHeight:
                    200.0, // use to limit the number of menu item shown

                // list of items
                items: questionSubject.map((String subject) {
                  return DropdownMenuItem(
                    value: subject,
                    child: Text(subject),
                  );
                }).toList(),

                onChanged: (String? newSubject) => setState(() {
                  selectedSubject = newSubject ?? '';
                }),
              ),
              const SizedBox(height: 260),
            ],
          ),
        ),
        Step(
          isActive: _index >= 2,
          title: const Text('preference'),
          content: Column(children: <Widget>[
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Method Preference(s)',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Choose the question solving method(s)',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              value: selectedPreference,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: questionPreference.map((String preference) {
                return DropdownMenuItem(
                  value: preference,
                  child: Text(preference),
                );
              }).toList(),
              onChanged: (String? newPreference) => setState(() {
                selectedPreference = newPreference ?? '';
              }),
            ),
            const SizedBox(height: 394),
          ]),
        ),
      ];

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from gallery'),
                  onTap: () {
                    imgFromGallery();
                    Navigator.of(context).pop;
                  }),
              ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Take picture from camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop;
                  }),
            ],
          ));
        });
  }
}
