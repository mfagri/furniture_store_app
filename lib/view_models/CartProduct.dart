import 'package:chairsapp/api/api.server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/categoreys.dart';

class CartItem {
  int quantity;
  int id;
  Products product;
  CartItem({required this.quantity, required this.id, required this.product});
}

class CartModel with ChangeNotifier {
  Map<int, CartItem> carts = {}; // Initialize with an empty map
  List<cart> _cartProducts = [];
  double _subtotal = 0;

  void initCarts() async {
    _cartProducts = await Apiserver.getUserCart();
    calculator();
    notifyListeners();
  }

  List<cart> get cartProduct => _cartProducts;
  double get subtotal => _subtotal;
  // void addCart(int id, int g,cart Cart) {
  //   // Cart with this ID doesn't exist, so create a new cart and add it.
  //   final cart = CartItem();
  //   carts[id] = cart;
  //   notifyListeners();
  // }

//   void getallcarts() async {
//   List<cart> cartss = await Apiserver.getUserCart();
//   for (int i = 0; i < cartss.length; i++) {
//     int cartId = cartss[i].id!; // Assuming the cart's ID is stored in the 'id' property
//     int g = cartss[i].quantity!;
//     addCart(cartId, g);
//   }
//   notifyListeners();
// }

  void incrementG(cart mycart) async {
    int myquantity = mycart.quantity!;
    int index = _cartProducts.indexOf(mycart);
    myquantity++;
    cart tmp = cart(
        id: mycart.id,
        userId: mycart.userId,
        productId: mycart.productId,
        quantity: myquantity,
        product: mycart.product);
    // _cartProducts.remove(mycart);
    // _cartProducts.add(tmp);
    _cartProducts[index] = tmp;
    Future<void> updateCart() async {
      await Apiserver.updateCartItemQuantity(mycart.productId!, myquantity);
    }

    updateCart();
    calculator();
    notifyListeners();
  }

  void calculator() async {
    // List<cart> carts = await Apiserver.getUserCart();
    double price = 0;
    for (int i = 0; i < _cartProducts.length; i++) {
      price += (_cartProducts[i].product!.price! * _cartProducts[i].quantity!);
    }
    _subtotal = price;
    // notifyListeners();
  }

  void set_subtotal(double mony) async {
    _subtotal = mony;
  }

  void removecart(cart mycart, BuildContext context) {
    int id = mycart.productId!;
    _cartProducts.remove(mycart);
    Future<void> remove() async {
      await Apiserver.removecart(id);
    }

    remove();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        content: const Text(
          'Cart removed',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
    notifyListeners();
    //snake bar
  }

  void decrementG(cart mycart) {
    int myquantity = mycart.quantity!;
    int index = _cartProducts.indexOf(mycart);
    if (myquantity > 1) myquantity--;
    cart tmp = cart(
        id: mycart.id,
        userId: mycart.userId,
        productId: mycart.productId,
        quantity: myquantity,
        product: mycart.product);
    // _cartProducts.remove(mycart);
    // _cartProducts.add(tmp);
    _cartProducts[index] = tmp;
    Future<void> updateCart() async {
      await Apiserver.updateCartItemQuantity(mycart.productId!, myquantity);
    }

    if (myquantity >= 1) updateCart();
    calculator();
    notifyListeners();
  }
  // You can add more methods for managing carts
}
