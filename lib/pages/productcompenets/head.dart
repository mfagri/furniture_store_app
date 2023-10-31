import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/List_categorys.dart';
import '../paint.dart';
import '../cartcompenents/cart.dart';

class Headproduct extends StatefulWidget {
  int id ;
  Headproduct({super.key,required this.id});

  @override
  State<Headproduct> createState() => _HeadproductState();
}

class _HeadproductState extends State<Headproduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * .3,
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .3,
            height: 140,
            child: Transform.rotate(
              angle: 3.15,
              child: CustomPaint(
                size: Size(110, (100 * 1.25).toDouble()),
                painter: RCustomPainter(),
                child: GestureDetector(
                  onTap: () async{
                    Navigator.pop(context,await Provider.of<Categorie_list>(context, listen: false)
        .isfavorite(widget.id));
                  },
                  child: Container(
                    width: 160,
                    height: MediaQuery.of(context).size.height * .14,
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
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Center(
            child: Text(
              'Product Details',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()), //////to cart
            );
          },
          child: Container(
            margin: EdgeInsets.only(right: 15),
            height: 80,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 30,
            ),
          ),
        )
      ]),
    );
  }
}
