import 'package:chairsapp/models/categoreys.dart';
import 'package:chairsapp/pages/homecompenents/listitems.dart';
import 'package:chairsapp/pages/paint.dart';
import 'package:flutter/material.dart';
import 'package:curved_carousel/curved_carousel.dart';

class Views extends StatefulWidget {
  final List<Products> products;
  final String nameCategory;
  const Views({Key? key,required this.products,required this.nameCategory}) : super(key: key);

  @override
  State<Views> createState() => _ViewsState();
}

class _ViewsState extends State<Views> with TickerProviderStateMixin {
  final List<Color> colorList = [
    const Color.fromARGB(255, 104, 196, 187),
    Color.fromARGB(255, 189, 187, 183),
    Color.fromARGB(255, 188, 196, 104),
    Color.fromARGB(255, 255, 210, 114),
    Color.fromARGB(255, 189, 187, 183),
    Color.fromARGB(255, 104, 196, 162),
    Color.fromARGB(255, 189, 187, 183),
  ];
  List<bool> boolList = List.generate(5, (index) => false);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurvedCarousel(
          animationDuration: 1000,
          itemBuilder: (context, i) {
            // Adjust as needed
            return Center(
              child: GestureDetector(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .90,
                  height: MediaQuery.of(context).size.height * .45,
                  child: CustomPaint(
                      painter: RPSCustomPainter(color:(i == _currentIndex)? Colors.grey[200]!:Colors.grey[400]!),
                      child:Item(
                        categoriesname: widget.nameCategory,
                        product: widget.products[i],
                        image: "",
                      )
                      ),
                ),
              ),
            );
          },
          scaleMiddleItem: true,
          viewPortSize: 0.3,
          disableInfiniteScrolling: false,
          onChangeEnd: (index, automatic) {
            setState(() {
               _currentIndex = index;
            });
          },
          middleItemScaleRatio: 1,
          itemCount: widget.products.length,
        ),
      ],
    );
  }
}
