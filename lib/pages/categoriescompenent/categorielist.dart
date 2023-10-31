import 'package:chairsapp/models/categoreys.dart';
import 'package:chairsapp/pages/categoriescompenent/categorieshead.dart';
import 'package:chairsapp/pages/categoriescompenent/filterfind.dart';
import 'package:chairsapp/pages/categoriescompenent/itemdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Categorielist extends StatefulWidget {
  final String name;
  final List<Products> products;
  const Categorielist({super.key, required this.name, required this.products});

  @override
  State<Categorielist> createState() => _CategorielistState();
}

class _CategorielistState extends State<Categorielist> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Headcategories(
              name: widget.name,
            ),
            SizedBox(
              height: 20,
            ),
            ///////hard part hahahahaha
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MasonryGridView.count(
                    itemCount: widget.products.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemBuilder: (context, index) {
                      return (index == 1)
                          ? Container(
                              height: 400,
                              // width: 150,
                              child: Column(children: [
                                Container(
                                  height: 80,
                                  color: Colors.white,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Filtterfind(),
                                        Container(
                                            margin: EdgeInsets.all(6),
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.grey[200]),
                                            child: Icon(Icons.filter_list)),
                                      ]),
                                ),
                                ItemCategories(
                                  index: index,
                                  product: widget.products[index],
                                  categoriesname: widget.name,
                                ),
                              ]),
                            )
                          : ItemCategories(
                              index: index,
                              product: widget.products[index],
                              categoriesname: widget.name,
                            );
                    },
                  ),
                ))
          ],
        ),
      )
      ),
    );
  }
}
