import 'package:chairsapp/api/api.server.dart';
import 'package:chairsapp/models/cart.dart';
import 'package:chairsapp/pages/cartcompenents/cartitem.dart';
import 'package:chairsapp/pages/cartcompenents/headcart.dart';
import 'package:chairsapp/pages/userprofile/googlelogin.dart';
import 'package:chairsapp/view_models/List_categorys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../view_models/CartProduct.dart';
import '../paint.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int myVariable = 0;
  @override
  void initState() {
    if (context.read<Categorie_list>().authontecated)
      Provider.of<CartModel>(context, listen: false).initCarts();
    super.initState();
    updateVariableAfterDelay();
  }

  void updateVariableAfterDelay() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        myVariable = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Categorie_list>(
      builder: (context, catego, child) {
        if (catego.Authontecated) {
          Provider.of<CartModel>(context, listen: false).initCarts();
          return Consumer2<Categorie_list, CartModel>(
            builder: (context, value, value2, child) => Scaffold(
                backgroundColor: Colors.white,
                body:(value2.cartProduct.isNotEmpty)? SafeArea(
                  child: ShowUpAnimation(
                    delayStart: Duration(milliseconds: 1),
                    animationDuration: Duration(milliseconds: 500),
                    curve: Curves.bounceIn,
                    direction: Direction.vertical,
                    offset: 0.5,
                    child: Column(
                      children: [
                        Carthead(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .36,
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 30),
                              itemCount: value2.cartProduct.length,
                              itemBuilder: (context, index) {
                                int g = value2.cartProduct[index].quantity!;
                                return Cartitem(
                                    mycart: value2.cartProduct[index], g: g);
                              }),
                        ),
                        Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: CustomPaint(
                                  size: Size(MediaQuery.of(context).size.width,
                                      MediaQuery.of(context).size.height * .36),
                                  painter: RPSCustomPainter(
                                      color:
                                          Color.fromARGB(255, 254, 248, 201)),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: (MediaQuery.of(context)
                                          .size
                                          .height
                                          .toInt() <=
                                      669)
                                  ? MediaQuery.of(context).size.height * .04
                                  : MediaQuery.of(context).size.height * .02,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.black),
                                    width: (myVariable == 1)
                                        ? MediaQuery.of(context).size.width * .8
                                        : 70,
                                    height: (MediaQuery.of(context)
                                                .size
                                                .height
                                                .toInt() <=
                                            669)
                                        ? 60
                                        : 70,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              // flex: 1,
                                              child: SizedBox(
                                                width: 0,
                                              ),
                                            ),
                                            const Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'Make Payment',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            InkWell(
                                              onTap: () {
                                                // _animateButton();
                                              },
                                              child: Container(
                                                height: (MediaQuery.of(context)
                                                            .size
                                                            .height
                                                            .toInt() <=
                                                        669)
                                                    ? 50
                                                    : 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.payment_rounded,
                                                    color: Colors.black,
                                                    size: 35,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: (MediaQuery.of(context)
                                            .size
                                            .height
                                            .toInt() <=
                                        669)
                                    ? MediaQuery.of(context).size.height * .009
                                    : MediaQuery.of(context).size.height * .02,
                                left: (MediaQuery.of(context)
                                            .size
                                            .width
                                            .toInt() <=
                                        376)
                                    ? MediaQuery.of(context).size.height * .07
                                    : MediaQuery.of(context).size.height * .06,
                                right: (MediaQuery.of(context)
                                            .size
                                            .width
                                            .toInt() <=
                                        376)
                                    ? MediaQuery.of(context).size.height * .07
                                    : MediaQuery.of(context).size.height * .06,
                                child: Container(
                                  width: 300,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .06,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Subtotal',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          ),
                                          Text(
                                            '\$${value2.subtotal.toString()}',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Delivery Charges',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          ),
                                          Text(
                                            '\$20.95',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: Container(
                                              height: 1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .33,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          ),
                                          Text(
                                            '\$${value2.subtotal + 20.95}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ):Container(
                  child: Center(
                    child: SafeArea(
                      child: Column(
                        children: [
                          Carthead(),
                          Container(
                            height: MediaQuery.of(context).size.height *.7,
                            child: Center(child: Text('No items in the cart yet.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),))),
                        ],
                      ),
                    ),
                  ),
                )
                )
                ,
          );
        } else {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
              ),
              body: Googlelogin());
        }
      },
    );
  }
}
