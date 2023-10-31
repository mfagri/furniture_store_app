import 'package:chairsapp/view_models/List_categorys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api.server.dart';
import '../../models/cart.dart';
import '../../view_models/CartProduct.dart';
import '../paint.dart';

class Cartitem extends StatefulWidget {
  cart mycart;

  int g;
  Cartitem({super.key, required this.mycart, required this.g});

  @override
  State<Cartitem> createState() => _CartitemState();
}

class _CartitemState extends State<Cartitem> {
  // void getdata() async {
  //   List<cart> cartss = await Apiserver.getUserCart();
  //   for(int i = 0 ;i < cartss.length!;i++){
  //      Provider.of<CartModel>(context, listen: false).addCart(cartss[i].id!,cartss[i].quantity!);
  //   }
  // }
  @override
  void initState() {
    // getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<Categorie_list, CartModel>(
      builder: (context, value, value2, child) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            "http://localhost:3000/${widget.mycart.product!.image.toString()}"))),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.mycart.product!.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '\$${(widget.mycart.product!.price! * widget.g).toString()}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.amber,
              width: MediaQuery.of(context).size.height * .12,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () {
                              
                              _showDeleteConfirmationDialog(widget.mycart);
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  // color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border:
                                Border.all(width: 0.2, color: Colors.black54),
                          ),
                          child: InkWell(
                            onTap: () async {
                              value2.decrementG(widget.mycart);
                            },
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                          child: Center(
                              child: Text(
                            '${widget.g.toString()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border:
                                Border.all(width: 0.2, color: Colors.black54),
                          ),
                          child: InkWell(
                            onTap: () async {
                              value2.incrementG(widget.mycart);
                            },
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
  void _showDeleteConfirmationDialog(cart mycart) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Cart Item",style: TextStyle(fontWeight: FontWeight.bold),),
          content: Text("Are you sure you want to delete this cart item?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.read<CartModel>().removecart(mycart, context);
                // Perform the delete operation here
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Delete",style: TextStyle(color: Colors.orange),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel",style: TextStyle(color: Colors.orange),),
            ),
          ],
        );
      },
    );
  }
}


