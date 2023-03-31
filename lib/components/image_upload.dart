import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
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
    return Container();
  }
}

// GlobalKey<_ImageUploadState> imageFromCameraKey = GlobalKey<_ImageUploadState>();
// ImageUpload cameraUpload = ImageUpload(key: imageFromCameraKey);

// GlobalKey<_ImageUploadState> imageFromAlbumKey = GlobalKey<_ImageUploadState>();
// ImageUpload albumUpload = ImageUpload(key: imageFromAlbumKey);
