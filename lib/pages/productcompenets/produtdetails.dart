import 'package:chairsapp/api/api.server.dart';
import 'package:chairsapp/models/categoreys.dart';
import 'package:chairsapp/pages/productcompenets/choose.dart';
import 'package:chairsapp/pages/productcompenets/detailes.dart';
import 'package:chairsapp/pages/productcompenets/head.dart';
import 'package:chairsapp/pages/productcompenets/model.dart';
import 'package:chairsapp/pages/productcompenets/prodactaddorremove.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/List_categorys.dart';

class Detailes extends StatefulWidget {
  final Products product;
  final String categoriesname;
  const Detailes(
      {super.key, required this.product, required this.categoriesname});

  @override
  State<Detailes> createState() => _DetailesState();
}

class _DetailesState extends State<Detailes> {
  Color buttoncolor = Colors.black;
  int valu = 0;
  List<String?> datamodel = [];
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

  double scaleFactor2 = 1.0;
  void _animateButton2() {
    setState(() {
      scaleFactor2 = 0.8; // Zoom in
    });
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        scaleFactor2 = 1.0; // Zoom out after a short delay
      });
    });
  }

  void initdata() async {
    int b = await Apiserver.quantityInCart(widget.product.id!);
    Provider.of<Categorie_list>(context, listen: false).update_quantity(b);
  }

  @override
  void initState() {
    initdata();
    Future.delayed(Duration.zero, () async {
      Provider.of<Categorie_list>(context, listen: false).set_indexcolors(0);
      for (int i = 0; i < widget.product.colors!.length; i++) {
        if (widget.product.imagePath?[i] != '') {
          datamodel.add(widget.product.imagePath?[i].toString());
        } else {
          datamodel.add(widget.product.modelPath?[i].toString());
        }
      }
      bool t = context.read<Categorie_list>().authontecated;
      if (t)
        Provider.of<Categorie_list>(context, listen: false)
            .isfavorite(widget.product.id!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Categorie_list>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Headproduct(
                      id: widget.product.id!,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Listener(
                        onPointerMove: (event) {},
                        child: (widget.product.modelPath![value.indexcolors] !=
                                '')
                            ? model3d(
                                modellink:
                                    "http://localhost:3000/${widget.product.modelPath![Provider.of<Categorie_list>(context, listen: false).indexcolors]}",
                              )
                            : SizedBox(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      child: Image(
                                        image: NetworkImage(
                                            "http://localhost:3000/${widget.product.imagePath![Provider.of<Categorie_list>(context, listen: false).indexcolors]}"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    AddorRemove(
                      id: widget.product.id!,
                    ),
                    DetailesProduct(
                      product: widget.product,
                      categoriesname: widget.categoriesname,
                    ),
                    ChooseType(
                      colors: widget.product.colors!,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            transform: Matrix4.diagonal3Values(
                                scaleFactor, scaleFactor, 1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey, width: 0.2),
                                  shape: BoxShape.circle),
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: value.favorite
                                      ? Colors.orange
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  bool t = context
                                      .read<Categorie_list>()
                                      .authontecated;
                                  if (t) {
                                    if (value.Favorite)
                                      value.removefromfavorite(
                                          widget.product.id!, context);
                                    else
                                      value.addtofavorite(
                                          widget.product.id!, context);
                                    value.changefavorit();
                                    _animateButton();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.orange,
                                        content: const Text(
                                          'You are not logged in',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        duration: const Duration(seconds: 2),
                                        action: SnackBarAction(
                                          label: 'go to login page',
                                          textColor: Colors.white,
                                          onPressed: () {
                                            Navigator.pop(context);
                                            context
                                                .read<Categorie_list>()
                                                .edit_index(3);
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                  // value.isfavorite(widget.product.id!);
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            //user should be signin
                            onTap: () async {
                              bool t =
                                  context.read<Categorie_list>().authontecated;
                              if (t) {
                                Future.delayed(Duration.zero, () async {
                                  if (value.quantity == 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.orange,
                                        content: const Text(
                                          'Quantity is 0 !!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        duration: const Duration(seconds: 1),
                                        // action: SnackBarAction(
                                        //   label: '',
                                        //   onPressed: () {},
                                        // ),
                                      ),
                                    );
                                  } else {
                                    Future<void> updateCart() async {
                                      await Apiserver.addtocart(
                                          widget.product.id!, value.quantity);
                                    }

                                    updateCart();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.orange,
                                        content: const Text(
                                          'Product added to Cart',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                  _animateButton2();
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.orange,
                                    content: const Text(
                                      'You are not logged in',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    duration: const Duration(seconds: 2),
                                    action: SnackBarAction(
                                      textColor: Colors.white,
                                      label: 'go to login page',
                                      onPressed: () {
                                        Navigator.pop(context);
                                        context
                                            .read<Categorie_list>()
                                            .edit_index(3);
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              transform: Matrix4.diagonal3Values(
                                  scaleFactor2, scaleFactor2, 1.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .06,
                                width: MediaQuery.of(context).size.width * .7,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
