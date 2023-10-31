import 'package:chairsapp/models/categoreys.dart';
import 'package:chairsapp/view_models/Favorit_provider.dart';
import 'package:chairsapp/view_models/List_categorys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api.server.dart';
import '../paint.dart';
import '../productcompenets/produtdetails.dart';

class ItemCategories extends StatefulWidget {
  final int index;
  final Products product;
  String categoriesname;
  ItemCategories(
      {super.key,
      required this.index,
      required this.product,
      required this.categoriesname});

  @override
  State<ItemCategories> createState() => _ItemCategoriesState();
}

class _ItemCategoriesState extends State<ItemCategories> {
  Color buttoncolor = Colors.black;
  double scaleFactor = 1.0;
  Color buttoncolor2 = Colors.black;
  double scaleFactor2 = 1.0;
  @override
  void intval() async {
    bool t = context.read<Categorie_list>().authontecated;
    if (t) {
      bool b = await Provider.of<Categorie_list>(context, listen: false)
          .isfavorite(widget.product.id!);
      setState(() {
        buttoncolor2 = b ? Colors.orange : Colors.black;
      });
      Category g = Category();
      if (widget.categoriesname == "")
        g = await Apiserver.getCategorysbyid(widget.product.id!);

      setState(() {
        buttoncolor2 = b ? Colors.orange : Colors.black;
        if (widget.categoriesname == "") {
          widget.categoriesname = g.name!;
        }
      });
    }
  }

  void initState() {
    // TODO: implement initState

    intval();
    super.initState();
  }

  void _animateButton3(bool value) {
    bool t = context.read<Categorie_list>().authontecated;
    if (t) {
      setState(() {
        if (value)
          buttoncolor2 = Colors.orange;
        else
          buttoncolor2 = Colors.black;
      });
    }
  }

  void _animateButton() {
    //add logic provider
    setState(() {
      if (buttoncolor != Colors.orange)
        buttoncolor = Colors.orange;
      else
        buttoncolor = Colors.black;

      scaleFactor = 0.8; // Zoom in
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        scaleFactor = 1.0; // Zoom out after a short delay
      });
    });
  }

  void _animateButton2() async {
    bool t = context.read<Categorie_list>().authontecated;
    if (t) {
      setState(() {
        if (buttoncolor2 != Colors.orange) {
          Provider.of<Categorie_list>(context, listen: false)
              .addtofavorite(widget.product.id!, context);
          buttoncolor2 = Colors.orange;
        } else {
          Provider.of<Categorie_list>(context, listen: false)
              .removefromfavorite(widget.product.id!, context);
          buttoncolor2 = Colors.black;
        }
        scaleFactor2 = 0.8; // Zoom in
      });
    } else {
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
                Navigator.pop(context);
                context.read<Categorie_list>().edit_index(3);
              },
            ),
        ),
      );
    }

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        scaleFactor2 = 1.0; // Zoom out after a short delay
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<Categorie_list, FavoriteModel>(
        builder: (context, value, value2, child) => Container(
              height: MediaQuery.of(context).size.height * .33,
              child: Stack(children: [
                Center(
                  child: Transform.rotate(
                    angle: -3.15,
                    child: CustomPaint(
                      size: Size(280, 300),
                      painter: RPSCustomPainter(color: Colors.grey[200]!),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                widget.product.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                maxLines: 2,
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              transform: Matrix4.diagonal3Values(
                                  scaleFactor2, scaleFactor2, 1.0),
                              child: InkWell(
                                onTap: () {
                                  _animateButton2();
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.2),
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: buttoncolor2,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detailes(
                                      categoriesname: widget.categoriesname,
                                      product: widget.product,
                                    )),
                          ).then((result) {
                            _animateButton3(result);
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .2,
                          width: MediaQuery.of(context).size.height * .2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                                'http://localhost:3000/${widget.product.image!}'),
                          )),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .34,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${widget.product.price}',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                InkWell(
                                  onTap: () {
                                    _animateButton();
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    transform: Matrix4.diagonal3Values(
                                        scaleFactor, scaleFactor, 1.0),
                                    child: Container(
                                      height: 35,
                                      width: 35,
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
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ]),
            ));
  }
}
