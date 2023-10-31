import 'package:chairsapp/pages/cartcompenents/cart.dart';
import 'package:flutter/material.dart';
import '../paint.dart';
import 'texthome.dart';

class head extends StatefulWidget {
  const head({super.key});

  @override
  State<head> createState() => _headState();
}

class _headState extends State<head> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .14,
      child: Container(
        height: 140,
        child: Center(
          child: Row(
            // scrollDirection: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Center(child: Texthome()),
                  )),
              Center(
                child: Container(
                  width: 110,
                  height: 140,
                  child: CustomPaint(
                    size: Size(110, (100 * 1.25).toDouble()),
                    painter: RCustomPainter(),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartPage()), //////to cart
                        );
                      },
                      child: Container(
                        width: 160,
                        height: MediaQuery.of(context).size.height * .14,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.grey[200],
                              size: 16,
                            ),
                            Transform.rotate(
                                angle: -33,
                                child: Container(
                                    child: Text(
                                  'Cart',
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
            ],
          ),
        ),
      ),
    );
  }
}
