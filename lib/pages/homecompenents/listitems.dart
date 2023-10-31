import 'package:chairsapp/models/categoreys.dart';
import 'package:chairsapp/pages/productcompenets/produtdetails.dart';
import 'package:flutter/material.dart';
import 'buttonanimated.dart';

class Item extends StatefulWidget {
  // late  bool isMiddleItem;
  final Products product;
  final String categoriesname;
  final String image;
  Item(
      {Key? key,
      required this.image,
      required this.product,
      required this.categoriesname})
      : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> with TickerProviderStateMixin {
  late AnimationController zoomInController;
  late Animation<double> zoomInAnimation;
  late Animation<double> zoomOutAnimation;
  late Animation<double> zoomSteperAnimation;
  late Animation<double> zoomOutButtonAnimation;
  late Animation<double> zoommoreAnimation;
  bool isMiddleItem = false;

  // TODO: implement initState

  @override
  void initState() {
    setState(() {
      isMiddleItem = false;
    });
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        isMiddleItem = true; // Zoom out after a short delay
      });
    });
    zoomInController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    zoomInAnimation = Tween<double>(
      begin: isMiddleItem ? 1 : 0,
      end: isMiddleItem ? 0 : 1,
    ).animate(CurvedAnimation(
      parent: zoomInController,
      curve: Curves.easeIn,
    ));
    zoommoreAnimation = Tween<double>(
      begin: 1.0,
      end: 1.01,
    ).animate(CurvedAnimation(
      parent: zoomInController,
      curve: Curves.fastOutSlowIn,
    ));
    zoomOutButtonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: zoomInController,
      curve: Curves.easeOut,
    ));
    zoomOutAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: zoomInController,
      curve: Curves.easeOut,
    ));

    zoomSteperAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: zoomInController,
      curve: Curves.easeOut,
    ));
    zoomInController.forward();
    zoomInController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          zoomInController.forward();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 5,
        ),
        Center(
          child: SizedBox(
            height: 250,
            width: 250,
            child: Stack(
              children: [
                Center(
                  child: ScaleTransition(
                    scale: zoomSteperAnimation,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "http://localhost:3000/${widget.product.image!}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTransition(
                        scale:
                            isMiddleItem ? zoomInAnimation : zoomOutAnimation,
                        child: ScaleTransition(
                          scale:
                              isMiddleItem ? zoomOutAnimation : zoomInAnimation,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detailes(
                                          categoriesname: widget.categoriesname,
                                          product: widget.product,
                                        )),
                              );
                            },
                            child: Container(
                              height: 250,
                              width: 350,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "http://localhost:3000/${widget.product.image!}"),
                                      fit: BoxFit.contain)),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
        ButtonAnimated(
          // isMiddleItem: widget.isMiddleItem,
          product: widget.product,
          zoomInAnimation: zoomInAnimation,
          zoomSteperAnimation: zoomSteperAnimation,
          zoomOutButtonAnimation: zoomOutButtonAnimation,
          zoommoreAnimation: zoommoreAnimation,
        )
      ],
    );
  }
}
