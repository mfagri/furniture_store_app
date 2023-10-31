import 'package:chairsapp/pages/userprofile/loginform.dart';
import 'package:chairsapp/pages/userprofile/signup.dart';
import 'package:chairsapp/view_models/List_categorys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api.server.dart';

class Googlelogin extends StatefulWidget {
  const Googlelogin({super.key});

  @override
  State<Googlelogin> createState() => _GoogleloginState();
}

class _GoogleloginState extends State<Googlelogin> {
  @override
 

  Widget build(BuildContext context) {
    return Consumer<Categorie_list>(
      builder: (context, value, child) => Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
                ),
                LoginForms(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Text(
                    'or Login With',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 200,
                              width: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          });
                      await Apiserver.googleSignIn();
                      value.Check_auth();
                      value.get_user();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/images/Google__G__Logo.svg.png'))),
                            ),
                          ),
                          Text(
                            'Login with Google',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () async {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return SizedBox(
                      //         height: 200,
                      //         width: 200,
                      //         child: Center(
                      //           child: CircularProgressIndicator(),
                      //         ),
                      //       );
                      //     });
                      // await Apiserver.googleSignIn();
                      // value.Check_auth();
                      // value.get_user();
                      // Navigator.pop(context);
                    },
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue[700],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/images/Facebook_Logo_(2019).png'))),
                            ),
                          ),
                          Text(
                            'Login with Facebook',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        'Dont have an Accont? ',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      )),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => SignupForm(),));
                        },
                        child: Center(
                            child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
