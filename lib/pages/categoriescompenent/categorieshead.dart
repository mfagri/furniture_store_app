import 'package:flutter/material.dart';

import '../paint.dart';
import '../cartcompenents/cart.dart';

class Headcategories extends StatefulWidget {
  final String name;
  const Headcategories({super.key, required this.name});

  @override
  State<Headcategories> createState() => _HeadcategoriesState();
}

class _HeadcategoriesState extends State<Headcategories> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Transform.rotate(
            angle: 3.15,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.height * .13,
                height: 120,
                child: CustomPaint(
                  size: Size(120, 120),
                  painter: RCustomPainter(),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
        RichText(
          text: TextSpan(
            text: widget.name,
            style: const TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: '\nCollections',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width *.1,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
          child: Container(
            margin: EdgeInsets.only(right: 10),
            height: 80,
            width: 45,
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
      ],
    );
  }
}
