import 'package:chairsapp/pages/favoritecompenents/itemfavorite.dart';
import 'package:chairsapp/pages/userprofile/googlelogin.dart';
import 'package:chairsapp/view_models/Favorit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../../view_models/List_categorys.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    // TODO: implement initState
     bool t = context
                                      .read<Categorie_list>()
                                      .authontecated;
     if(t)                           
      Provider.of<FavoriteModel>(context, listen: false).get_favorit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Categorie_list>(builder:(context, value2, child) { 
    if(value2.authontecated){
      Provider.of<FavoriteModel>(context, listen: false).get_favorit();
      return  Consumer<FavoriteModel>(
      builder: (context, value, child) {
        value.get_favorit();
        if(value.favoriteproduct.isNotEmpty){
          return SafeArea(
          child: Container(
        child: Column(
          children: [
            // Headcategories(
            //   name: widget.name,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Favorite',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MasonryGridView.count(
                    itemCount: value.favoriteproduct.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemBuilder: (context, index) {
                      return ItemFavorite(
                        index: index,
                        productfavorite: value.favoriteproduct[index],
                        categoriesname: "hh",
                      );
                    },
                  ),
                ))
          ],
        ),
      ));
        }
        else{
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'No Favorite',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
      } 
    );
    
    }
    else
    {
      return Googlelogin();
    }
    }
    );
    
  }
}
 
