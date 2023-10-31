import 'dart:io';

import 'package:chairsapp/api/api.server.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../tools/validator.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';

import '../../view_models/List_categorys.dart';

class SginupContainer extends StatefulWidget {
  File? img;
  SginupContainer({super.key, required this.img});

  @override
  State<SginupContainer> createState() => _SginupContainerState();
}

class _SginupContainerState extends State<SginupContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _username = '';
  String? _emaile = '';
  String? _password = '';
  String? _password2 = '';

  Future<File> loadAssetAsFile(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final List<int> bytes = data.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/${assetPath.split('/').last}');

    await tempFile.writeAsBytes(bytes, flush: true);

    return tempFile;
  }

  void _submitForm() {
    if (widget.img == null)//send msg if no img
      loadAssetAsFile('lib/images/Empty Profile Icon.jpeg').then((file) {
        setState(() {
          widget.img = file;
        });
      });
    if (_formKey.currentState!.validate()) {
      Apiserver.uploadImageWithFormData(
          widget.img!, _username!, _emaile!, _password!, _password2!);

      context.read<Categorie_list>().Check_auth();
      context.read<Categorie_list>().get_user();
      context.read<Categorie_list>().edit_index(3);
      // Navigator.pop(context);
    }
  }

  bool _obscureText = true;
  bool _obscureText2 = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _togglePasswordVisibility2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        border: OutlineInputBorder(
                          // Border around the input
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelStyle: TextStyle(color: Colors.orange)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      var result = validateUsername(value);
                      if (!result.isValid) {
                        return result.error;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _username = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        border: OutlineInputBorder(
                          // Border around the input
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelStyle: TextStyle(color: Colors.orange)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      var result = validateEmail(value);
                      if (!result.isValid) {
                        return result.error;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _emaile = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hoverColor: Colors.orange,
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.orange),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        border: OutlineInputBorder(
                          // Border around the input
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _togglePasswordVisibility,
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        focusColor: Colors.orange),
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      var result = validatePassword(value);
                      if (!result.isValid) {
                        return result.error;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hoverColor: Colors.orange,
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.orange),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _togglePasswordVisibility2,
                          child: Icon(
                            _obscureText2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(
                          // Border around the input
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusColor: Colors.orange),
                    obscureText: _obscureText2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      var result = validatePassword(value);
                      if (!result.isValid) {
                        return result.error;
                      }
                      if (_password2 != _password) {
                        return 'incorrect confirm password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _password2 = value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  onTap: () {
                    _submitForm();
                  },
                  child: Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
