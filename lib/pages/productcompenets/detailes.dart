import 'package:chairsapp/models/categoreys.dart';
import 'package:flutter/material.dart';

class DetailesProduct extends StatefulWidget {
  Products product;
   final String categoriesname;
   DetailesProduct({super.key,required this.product,required this.categoriesname});

  @override
  State<DetailesProduct> createState() => _DetailesProductState();
}

class _DetailesProductState extends State<DetailesProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.categoriesname,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black38),
                  ),
                  const Spacer(),
                  Text(
                    widget.product.name!,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              '\$${widget.product.price}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
