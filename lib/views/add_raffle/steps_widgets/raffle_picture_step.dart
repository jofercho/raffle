import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';

class RafflePictureStep extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  final AddRaffleValidation addRaffleValidation;

  RafflePictureStep({Key? key, required this.addRaffleValidation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? pickedFile = addRaffleValidation.picture.value;
    return Column(
      children: [
        if (pickedFile != null) Image.file(File(pickedFile), width: 300, height: 300,),
        ElevatedButton(
          child: const Text('Add from gallery'),
          onPressed: (() async {
            try {
              var image = await _picker.pickImage(
                  source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800);
              addRaffleValidation.changePicture(image!.path);
            } catch (e) {
              print('exception $e');
            }
          }),
        ),
        ElevatedButton(
          child: const Text('Add from camera'),
          onPressed: (() async {
            final XFile? image = await _picker.pickImage(
                source: ImageSource.camera, maxWidth: 1800, maxHeight: 1800);
            addRaffleValidation.changePicture(image!.path);   
          }),
        )
      ],
    );
  }
}
