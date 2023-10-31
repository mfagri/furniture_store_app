import 'dart:convert';
import 'dart:io';
import 'package:chairsapp/api/api.server.dart';
import 'package:chairsapp/view_models/List_categorys.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chairsapp/pages/homecompenents/categoriesnames.dart';
import 'package:chairsapp/pages/homecompenents/head.dart';
import 'package:chairsapp/pages/tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/categoreys.dart';
import 'view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Category> data1 = [];
  void initdata() async {
    setState(() {
      data1 = Provider.of<Categorie_list>(context, listen: false).categorys;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initdata();
    super.initState();
  }
  int _selectedIndex1 = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Container(
          // color: Colors.amber,
          child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                head(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data1.length,
                    itemBuilder: (context, index) {
                      return Tabs1(
                        icon: Container(
                            height: 30,
                            width: 30,
                            child: SvgPicture.network(
                                color: (index == _selectedIndex1)
                                    ? Colors.white
                                    : Colors.black,
                                "http://localhost:3000${data1[index].icon}")),
                        tabName: data1[index].name.toString(),
                        index: index,
                        selectedIndex: _selectedIndex1,
                        onTap: (selectedIndex2) {
                          setState(() {
                            _selectedIndex1 = selectedIndex2;
                          });
                        },
                      );
                    },
                  ),
                ),
                Container(
                  child: Categoriesnames(
                    name: data1[_selectedIndex1].name.toString(),
                    products: data1[_selectedIndex1].products!,
                  ),
                ),
                if (!kIsWeb)
                  SizedBox(
                    height: (Platform.isIOS) ? 40 : 20,
                  ),
                // Expanded(
                //   flex: (MediaQuery.of(context).size.width * 0.2).toInt(),
                  // product: data1[_selectedIndex1].products!,
                  if (data1[_selectedIndex1].products!.length != 0)
                       Views(
                          products: data1[_selectedIndex1].products!,
                          nameCategory: data1[_selectedIndex1].name.toString(),
                        )
                      else Container(
                          child: Center(
                            child: Text('No product yet!!'),
                          ),
                        ),
                // )
              ]),
        ));
  }
}
