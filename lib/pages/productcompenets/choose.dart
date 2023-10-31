import 'package:chairsapp/pages/productcompenets/produtdetails.dart';
import 'package:chairsapp/view_models/List_categorys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../paint.dart';

class ChooseType extends StatefulWidget {
  List<String>colors;
   ChooseType({super.key,required this.colors});

  @override
  State<ChooseType> createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {
  List<Color> extractColors(List<String> colorCodes) {
  List<Color> colors = [];
  for (String code in colorCodes) {
    // Remove the '#' character from the color code
    String cleanedCode = code.replaceAll("#", "");

    // Parse the hexadecimal color code and create a Color object
    Color color = Color(int.parse('0xFF$cleanedCode'));
    colors.add(color);
  }
  return colors;
}
  int selectindex = 0;
  void __selectone(int index) {
    setState(() {
    selectindex = index;
    // colorsshows =index;
    // print(colorsshows);  
    });
    Provider.of<Categorie_list>(context,listen: false).set_indexcolors(index);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text('Choose Colours',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38)),
            ],
          ),
        ),
        SizedBox(height: 10), // Add some spacing
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.colors.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        __selectone(index);
                      });
                    },
                    child: _buildColoredBox(extractColors(widget.colors)[index], index));
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColoredBox(Color color, int index) {
    return Container(
      width: 90,
      height: 80,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: (index != selectindex)
              ? Border.all(color: Colors.black45, width: 0.2)
              : Border.all(color: Colors.black, width: 0.5),
          color: color,
          borderRadius: BorderRadius.circular(20)), // Add margin for spacing
    );
  }
}
