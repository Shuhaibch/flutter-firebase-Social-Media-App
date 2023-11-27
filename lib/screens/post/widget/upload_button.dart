// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_repository/post_repository.dart';

// ignore: must_be_immutable
class UploadButton extends StatelessWidget {
  final Post post;
  CroppedFile? croppedFile;
  UploadButton({
    Key? key,
    required this.post,
    this.croppedFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(
            source: ImageSource.gallery,
            maxHeight: 500,
            maxWidth: 500,
            imageQuality: 40);
        if (image != null) {
          croppedFile = await ImageCropper().cropImage(
            sourcePath: image.path,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            aspectRatioPresets: [CropAspectRatioPreset.square],
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Theme.of(context).colorScheme.primary,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              ),
              IOSUiSettings(
                title: 'Cropper',
              ),
            ],
          );
          if (croppedFile != null) {
            log(croppedFile.toString());
          }
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .4,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            elevation: 3,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 5,
            ),
            child: Text(
              "Upload Media",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
