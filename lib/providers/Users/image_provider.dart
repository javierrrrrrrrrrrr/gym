import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import 'package:image_cropper/image_cropper.dart';

class SelectImg extends ChangeNotifier {
  bool isTouch = false;
  String? imagePath = "";
  String? imageAdminPath = "";
  final ImagePicker _picker = ImagePicker();
  ImageCropper crop = ImageCropper();

  File? img;
  File? imgAdmin;

  Future pikeImage(bool camara) async {
    try {
      final photo = await _picker.pickImage(
          source: camara == false ? ImageSource.gallery : ImageSource.camera,
          imageQuality: 100,
          maxHeight: 900,
          maxWidth: 600);
      if (photo != null) {
        img = File(photo.path);

        imagePath = photo.path;

        notifyListeners();
      }

      lowImgQuality(img!, imagePath!);

      notifyListeners();
      // ignore: empty_catches
    } catch (e) {}
  }

  Future pickAdminImage() async {
    try {
      final photo = await _picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 100,
          maxHeight: 900,
          maxWidth: 600);
      if (photo != null) {
        imgAdmin = File(photo.path);

        // print(img.lengthSync());

        imageAdminPath = photo.path;
        notifyListeners();
      }
      lowAdminImgQuality(imgAdmin!, imageAdminPath!);

      notifyListeners();

      // ignore: empty_catches
    } catch (e) {}
  }

  cropFile() async {
    try {
      File? croppedFile = await crop.cropImage(
          sourcePath: imagePath!,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: const AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: const IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));

      img = croppedFile ?? img;
      // print(img.lengthSync());
      notifyListeners();
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<File> lowImgQuality(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      imagePath!,
      imagePath! + '_img.jpg',
      quality: 50,
    );

    img = result!;
    notifyListeners();
    //print(file.lengthSync());

    notifyListeners();
    return result;
  }

  Future<File> lowAdminImgQuality(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      imageAdminPath!,
      imageAdminPath! + '_img.jpg',
      quality: 50,
    );

    img = result!;
    notifyListeners();
    //print(file.lengthSync());

    notifyListeners();
    return result;
  }
}
