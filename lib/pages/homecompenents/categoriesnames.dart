import 'package:chairsapp/models/categoreys.dart';
import 'package:chairsapp/pages/categoriescompenent/categorielist.dart';
import 'package:flutter/material.dart';

class Categoriesnames extends StatefulWidget {
  final String name;
  final List<Products> products;
  const Categoriesnames({super.key,required this.name,required this.products});

  @override
  State<Categoriesnames> createState() => _CategoriesnamesState();
}

class _CategoriesnamesState extends State<Categoriesnames> {
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: widget.name,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: ' Collections',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> Categorielist(name: widget.name,products: widget.products,) ));
                    },
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      size: 35,
                    ),
                  )
                ],
              ),
            );
  }
}