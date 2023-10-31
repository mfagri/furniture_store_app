import 'package:flutter/material.dart';

import '../paint.dart';

class Carthead extends StatefulWidget {
  const Carthead({super.key});

  @override
  State<Carthead> createState() => _CartheadState();
}

class _CartheadState extends State<Carthead> {
  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Transform.rotate(
                        angle: 3.15,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 120,
                            height: 140,
                            child: CustomPaint(
                              size: Size(110, (100 * 1.25).toDouble()),
                              painter: RCustomPainter(),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 160,
                                  height:
                                      MediaQuery.of(context).size.height * .14,
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Colors.grey[200],
                                        size: 16,
                                      ),
                                      Transform.rotate(
                                          angle: 33,
                                          child: Container(
                                              child: Text(
                                            'Back',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                    ],
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Checkout     ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 80,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.keyboard_control,
                        size: 30,
                      ),
                    )
                  ],
                );
  }
}