import 'package:chairsapp/api/api.server.dart';
import 'package:chairsapp/models/cart.dart';
import 'package:chairsapp/models/categoreys.dart';
import 'package:chairsapp/models/favoritproduct.dart';
import 'package:chairsapp/pages/favoritecompenents/favorite.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/user.dart';



class Categorie_list extends ChangeNotifier {
  int _index_page = 0;
  int get index_page => _index_page;
//  Map<int, CartItem> carts = {}; // Initialize with an empty map
void edit_index(int index){
  _index_page = index;
  notifyListeners();
}
  // void addCart(int id, int g) {
  //   final cart = CartItem(id: id, g: g);
  //   carts[id] = cart; // Add to the map using the cart ID as the key
  //   notifyListeners();
  // }

  // void incrementG(int id) {
  //   if (carts.containsKey(id)) {
  //     carts[id]!.g++;
  //     notifyListeners();
  //   }
  // }

  // void decrementG(int id) {
  //   if (carts.containsKey(id) && carts[id]!.g > 1) {
  //     carts[id]!.g--;
  //     notifyListeners();
  //   }
  // }
  List<Category> _categorydata = [];
  
  // double _subtotal = 0;
  int _quantity = 0;
  double _total = 0;
  int _index_colors = 0;
  Future<void> fetchCategorey() async {
    _categorydata = await Apiserver.getCatrgories();
    notifyListeners();
  }

  void set_indexcolors(int index) {
    _index_colors = index;
    // print(_index_colors);
    notifyListeners();
  }

  List<Category> get categorys => _categorydata;
  int get indexcolors => _index_colors;
  int get quantity => _quantity;
  double get total => _total;

  user Myuser = user();
  bool Authontecated = false;
  bool get authontecated => Authontecated;
  void Check_auth() async {
    String? result = await Authontication.getData('auth');
    if (result != null && result.isNotEmpty) {
      Authontecated = true;
    } else {
      Authontecated = false;
    }
    notifyListeners();
  }

  void update_quantity(int value) {
    _quantity = value;
    notifyListeners();
  }



  void get_user() async {
    String? result = await Authontication.getData('auth');
    try {
      Myuser = await Apiserver.getauth(result.toString());
      Apiserver.Myuser = Myuser;
    } catch (e) {
      Authontication.removeData('auth');
    }
    notifyListeners();
  }

  bool favorite = false;
  Future<bool> isfavorite(int id) async {
    bool b = await (Apiserver.isProductInFavorites(id));
    favorite = b;
    notifyListeners();
    return b;
  }

  void changefavorit() {
    favorite = !favorite;
    notifyListeners();
  }

  

  void addtofavorite(int id, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            width: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
    await (Apiserver.addtofavorite(id));
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          content: const Text(
            'Product added to favorites',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          duration: const Duration(seconds: 1),
          
        ));
    Navigator.pop(context);
  }

  void removefromfavorite(int id, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            width: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
    await (Apiserver.removefromfavorite(id));
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          content: const Text(
            'Product removed from favorites',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          duration: const Duration(seconds: 1),
          
        ));
    notifyListeners();
    Navigator.pop(context);
  }

  bool get Favorite => favorite;
}
