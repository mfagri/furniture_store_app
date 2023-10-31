import 'dart:io';

import 'package:chairsapp/pages/userprofile/signupform.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  File? _image;
   Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: ListView(children: [
            Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Center(
                        child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                  ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 InkWell(
                  onTap: () {
                     _getImageFromGallery();
                  },
                   child: 
                   (_image == null)
                ? Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.grey[200],
                      image: DecorationImage(image: AssetImage(
                        'lib/images/Empty Profile Icon.jpeg'
                      )
                      ),
                      shape: BoxShape.circle),
                   )
                : Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(_image!)
                    )
                  ),
                  
                ),
                   
                    
                 ),
               ],
             ),
             SginupContainer(img: _image,)   
          ]
          ),
        ),
      ),
    );
  }
}