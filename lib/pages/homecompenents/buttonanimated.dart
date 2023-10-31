import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:chairsapp/main.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:provider/provider.dart';
import 'package:chairsapp/api/api.server.dart';
import 'package:chairsapp/models/categoreys.dart';
import 'package:flutter/material.dart';

import '../../view_models/List_categorys.dart';

class ButtonAnimated extends StatefulWidget {
  final Animation<double> zoommoreAnimation;
  final Animation<double> zoomSteperAnimation;
  final Animation<double> zoomOutButtonAnimation;
  final Animation<double> zoomInAnimation;
  final Products product;
  ButtonAnimated(
      {super.key,
      required this.product,
      required this.zoommoreAnimation,
      required this.zoomSteperAnimation,
      required this.zoomInAnimation,
      required this.zoomOutButtonAnimation});

  @override
  State<ButtonAnimated> createState() => _ButtonAnimatedState();
}

class _ButtonAnimatedState extends State<ButtonAnimated> {
  //////////////////////////////////

  Color buttoncolor = Colors.black;
  bool isMiddleItem = false;
  double scaleFactor = 1.0;

  @override
  void initdata() async {
    int b = await Apiserver.quantityInCart(widget.product.id!);
    if (b > 0)
      setState(() {
        buttoncolor = Colors.orange;
        b = 0;
      });
  }

  void initState() {
    bool t = context.read<Categorie_list>().authontecated;
    if (t) initdata();
    isMiddleItem = false;
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        isMiddleItem = true; // Zoom out after a short delay
      });
    });
    super.initState();
  }

  void _animateButton() async {
    bool t = context.read<Categorie_list>().authontecated;
    if (t) {
      if(buttoncolor != Colors.orange)
      {

      await Apiserver.addtocart(widget.product.id!, 1);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          content: const Text(
            'Product added to Cart',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
      }
      else{
         ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          content: const Text(
            'Product already added to Cart',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
      }
    }

    setState(() {
      if (t)
        buttoncolor = Colors.orange;
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orange,
            content: const Text(
              'You are not logged in',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'go to login page',
              textColor: Colors.white,
              onPressed: () {
                context.read<Categorie_list>().edit_index(3);
              },
            ),
          ),
        );
      }
      scaleFactor = 0.8; // Zoom in
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        scaleFactor = 1.0; // Zoom out after a short delay
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .08,
        width: 300,
        child: Stack(
          children: [
            Center(
              child: ScaleTransition(
                scale: widget.zoommoreAnimation,
                child: ScaleTransition(
                  scale: widget.zoomSteperAnimation,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .06,
                    width: MediaQuery.of(context).size.height * .06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.height * .07,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ScaleTransition(
              scale: widget.zoomOutButtonAnimation,
              child: ScaleTransition(
                scale: widget.zoomInAnimation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      width: isMiddleItem ? 300 : 60,
                      height: MediaQuery.of(context).size.height * .07,
                      margin: EdgeInsets.symmetric(
                          horizontal: isMiddleItem ? 0 : 0),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  widget.product.name.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("\$${widget.product.price.toString()}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange)),
                              ],
                            )),
                            InkWell(
                              onTap: () async {
                                _animateButton();
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                transform: Matrix4.diagonal3Values(
                                    scaleFactor, scaleFactor, 1.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: buttoncolor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
