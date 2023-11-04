import 'package:chairsapp/api/api.server.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../tools/validator.dart';
import '../../view_models/List_categorys.dart';

class LoginForms extends StatefulWidget {
  const LoginForms({super.key});

  @override
  State<LoginForms> createState() => _LoginFormsState();
}

class _LoginFormsState extends State<LoginForms> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _username = '';
  String? _password = '';
    bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  void _submitForm() async{
    if (_formKey.currentState!.validate()) {
    await  Apiserver.loginuser(_username!, _password!,context);
    Provider.of<Categorie_list>(context, listen: false).Check_auth();
    Provider.of<Categorie_list>(context, listen: false).get_user();
    setState(() {
      
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
                        labelText: 'email',
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
                        return 'Please enter your email';
                      }
                      var result = validateEmail(value);
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
              SizedBox(
                height: 30,
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
                        suffixIcon: GestureDetector(
                          onTap: _togglePasswordVisibility,
                          child: Icon(
                            _obscureText
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
                        'Login',
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
