import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../models/resource_model.dart';

class ResourcesStepper extends StatefulWidget {
  const ResourcesStepper({super.key});

  @override
  State<ResourcesStepper> createState() => _QuestionStepperState();
}

class _QuestionStepperState extends State<ResourcesStepper> {
  int _index = 0;

  final _title = TextEditingController();
  final _description = TextEditingController();
  String? selectedCategory;
  String? selectedSubject;
  String? selectedLevel;

  var resourceCategory = [
    'notes',
    'pyq',
    'video',
  ];

  var resourceSubject = [
    'Maths',
    'Chemistry',
    'Physic',
    'Add Math',
    'Biology',
    'History',
    'Music',
    'Art'
  ];

  var resourceLevels = ['PT3', 'SPM', 'UEC', 'IGSCE'];

  // create a storage instance
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _resource;
  final ImagePicker _picker = ImagePicker();

  // to select pic from gallery
  Future imgFromGallery() async {
    final resource = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (resource != null) {
        _resource = File(resource.path);
        uploadResource();
      }
    });
  }

  // to select pic from camera
  Future imgFromCamera() async {
    final resource = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (resource != null) {
        _resource = File(resource.path);
        uploadResource();
      }
    });
  }

  // to upload resource
  Future uploadResource() async {
    if (_resource == null) return;
    final fileName = File(_resource!.path);
    final destination = 'questionPic/$fileName';

    final ref = firebase_storage.FirebaseStorage.instance
        .ref(destination)
        .child('resources/');

    await ref.putFile(_resource!);
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
                          createResource(
                              title: _title.text,
                              description: _description.text,
                              resourceCategory: selectedCategory!,
                              resourceSubject: selectedSubject!,
                              resourceLevel: selectedLevel!,);

                          // direct back to question posting page
                          context.go('/resources/categories');
                        },
                        child: const Text('Submit'))),
            ],
          );
        });
  }

  Future createResource(
      {required String title,
      required String description,
      required String resourceCategory,
      required String resourceSubject,
      required String resourceLevel,}) async {
    // reference to document
    final docResource =
        FirebaseFirestore.instance.collection('resources/subjects/${resourceSubject.toLowerCase()}/type/$resourceCategory').doc();

    // create data using the reference
    final resource = Resource(
      id: docResource.id,
      title: title,
      description: description,
      resourceCategory: resourceCategory,
      resourceSubject: resourceSubject,
      resourceLevel: resourceLevel,
      tutor: 'Cikgu Zemin',
      likes: 0,
      downloads: 0,
    );
    final json = resource.toJson();

    // create document and write daya to Firebase
    await docResource.set(json);
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
                  hintText: 'Give your resource a short title',
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
                  hintText: 'Tell us more about the resource',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
              const SizedBox(height: 213),
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
                  labelText: 'Category',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Choose the category of your resources',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      )),
                ),
                // initial value
                value: selectedCategory,

                // arrow icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // array list of items
                items: resourceCategory.map((String level) {
                  return DropdownMenuItem(
                    value: level,
                    child: Text(level),
                  );
                }).toList(),

                onChanged: (String? newCategory) => setState(() {
                  selectedCategory = newCategory ?? '';
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
                items: resourceSubject.map((String subject) {
                  return DropdownMenuItem(
                    value: subject,
                    child: Text(subject),
                  );
                }).toList(),

                onChanged: (String? newSubject) => setState(() {
                  selectedSubject = newSubject ?? '';
                }),
              ),
              const SizedBox(height: 70),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Syllabus',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Choose the syllabus of your resource',
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
                items: resourceLevels.map((String level) {
                  return DropdownMenuItem(
                    value: level,
                    child: Text(level),
                  );
                }).toList(),

                onChanged: (String? newLevel) => setState(() {
                  selectedLevel = newLevel ?? '';
                }),
              ),
              const SizedBox(height: 126),
            ],
          ),
        ),
        Step(
          isActive: _index >= 2,
          title: const Text('resources'),
          content: Column(children: <Widget>[
            const SizedBox(height: 20),
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
                      _resource != null
                          ? Image.file(
                              _resource!,
                              width: 50,
                              height: 50,
                            )
                          : const Image(
                              image: AssetImage('assets/uploadImage.png'),
                              height: 50,
                            ),
                      const Text(
                        'Upload resource',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
