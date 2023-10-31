

import 'package:chairsapp/api/api.server.dart';
import 'package:flutter/material.dart';

import '../models/favoritproduct.dart';

class FavoriteModel extends ChangeNotifier{
  List<FavoritProduct> _favoriteProduct = [];


  void get_favorit()async{

    _favoriteProduct = await Apiserver.getFavoriteproduct();
    notifyListeners();
  }

  List<FavoritProduct> get favoriteproduct => _favoriteProduct;

  void addtofavorite(int id)async{
    await Apiserver.addtofavorite(id);
    _favoriteProduct = await Apiserver.getFavoriteproduct();
    notifyListeners();
  }

  void removefromfavorite(FavoritProduct product)async{
    _favoriteProduct.remove(product);
    await Apiserver.removefromfavorite(product.productId!);
    notifyListeners();
  }

}