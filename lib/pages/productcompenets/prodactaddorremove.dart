import 'package:chairsapp/view_models/List_categorys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api.server.dart';

class AddorRemove extends StatefulWidget {
  int id;
  AddorRemove({super.key, required this.id});

  @override
  State<AddorRemove> createState() => _AddorRemoveState();
}

class _AddorRemoveState extends State<AddorRemove> {
  double scaleFactor = 1.0;
  void _animateButton() {
    setState(() {
      scaleFactor = 0.8; // Zoom in
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        scaleFactor = 1.0; // Zoom out after a short delay
      });
    });
  }

  void initdata() async {
    int b = await Apiserver.quantityInCart(widget.id);
    Provider.of<Categorie_list>(context, listen: false).update_quantity(b);
  }

  @override
  void initState() {
    initdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Categorie_list>(
        builder: (context, value, child) => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 70,
              // color: Colors.amber,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 0.2),
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () {
                          _animateButton();
                          value.update_quantity(value.quantity + 1);
                          // Future<void> updateCart() async {
                          //     await Apiserver.addtocart(
                          //         widget.id, value.quantity );
                          //   }
                          //   updateCart();
                        },
                        icon: Icon(Icons.add)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    transform:
                        Matrix4.diagonal3Values(scaleFactor, scaleFactor, 1.0),
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Text(
                          '${value.quantity}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ))),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //       height: 60,
                //       width: 60,
                //       decoration:
                //           BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
                //       child: Center(
                //           child: Text(
                //         '$value',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 15),
                //       ))),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 0.2),
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () {
                          if (value.quantity > 1) {
                            _animateButton();
                            value.update_quantity(value.quantity - 1);
                            // Future<void> updateCart() async {
                            //   await Apiserver.addtocart(
                            //       widget.id, value.quantity );
                            // }
                            // updateCart();
                          }
                        },
                        icon: Icon(Icons.remove)),
                  ),
                )
              ]),
            )));
  }
}
