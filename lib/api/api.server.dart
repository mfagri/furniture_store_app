import 'dart:convert';
import 'dart:io';


import 'package:chairsapp/main.dart';
import 'package:chairsapp/models/cart.dart';
import 'package:chairsapp/models/favoritproduct.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../models/categoreys.dart';
import '../models/user.dart';

class Apiserver {
  static user Myuser = user();
  static Future<List<Category>> getCatrgories() async {
    var url = Uri.http('localhost:3000', '/api/getCategorys');
    // print(url);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      // print(res.body);
      List<dynamic> data = jsonDecode(res.body);
      return (data.map((e) => Category.fromJson(e)).toList());
    } else
      return ([]);
  }

  static Future<Category> getCategorysbyid(int id) async {
    var url = Uri.http('localhost:3000', '/api/getCategorybyId/$id');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      dynamic data = jsonDecode(res.body);
      return Category.fromJson(data[0]);
    } else
      return Category();
  }

  static Future<user> getauth(String auth) async {
    var resfinal = await http.get(
      Uri.parse('http://localhost:3000/api/myuser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': auth
      },
    );
    user User = user.fromJson(jsonDecode(resfinal.body));
    return User;
  }

  static Future<dynamic> addtocart(int productid, int quantity) async {
    try{

    String? auth = await Authontication.getData('auth');
    Map data = {
      "quantity": quantity.toString(),
      "productid": productid.toString()
    };
    var res = await http.post(Uri.parse('http://localhost:3000/api/addtocart'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': auth!
        },
        body: json.encode(data));
    }
    catch(e){

    }
  }

 static Future<dynamic> updateCartItemQuantity(int productid, int quantity) async {
    String? auth = await Authontication.getData('auth');
    Map data = {
      "quantity": quantity.toString(),
      "productid": productid.toString()
    };
    try{

    var res = await http.post(Uri.parse('http://localhost:3000/api/updateCartItemQuantity'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': auth!
        },
    body: json.encode(data));
    }
    catch(e){}
  }

  static Future<int> quantityInCart(int productid) async {
    try {
      String? auth = await Authontication.getData('auth');

      var res = await http.get(
          Uri.parse('http://localhost:3000/api/quantityInCart/$productid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': auth!
          });
      if (res.statusCode == 200) {
        int b = jsonDecode(res.body)['quantity'];
        return b;
      } else
        return 0;
    } catch (e) {
      return 0;
    }
  }

  static Future<List<cart>> getUserCart()async{
    try{

     String? auth = await Authontication.getData('auth');
       var res = await http.get(
          Uri.parse('http://localhost:3000/api/getUserCart'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': auth!
          });
      List<dynamic> data = jsonDecode(res.body);
     return data.map((e)=> cart.fromJson(e)).toList();
    }
    catch(e){
      return [];
    }
  }

  static Future<dynamic> removecart(int  productId)async{
    String? auth = await Authontication.getData('auth');
    Map data = {
      "productId":  productId.toString()
    };
    try{

    var res = await http.post(Uri.parse('http://localhost:3000/api/removeFromCart'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': auth!
        },
    body: json.encode(data));
    }
    catch(e){}
  }

  static Future<dynamic> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? account = await _googleSignIn.signIn();

    if (account != null) {
      print("User ID: ${account.id}");
      print("Display Name: ${account.displayName}");
      print("Email: ${account.email}");
      print("Profile Picture URL: ${account.photoUrl}");
      Map data = {
        "data": {
          "username": account.displayName.toString(),
          "image": account.photoUrl.toString(),
          "email": account.email.toString()
        }
        // "password":"no needed"
      };
      var res = await http.post(Uri.parse('http://localhost:3000/api/signin'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(data));
      var resfinal = await http.get(
        Uri.parse('http://localhost:3000/api/myuser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': res.body
        },
      );
      Authontication.storeData('auth', res.body);
      print(Authontication.getData('auth'));
      Myuser = user.fromJson(jsonDecode(resfinal.body));
      print("username is " + Myuser.username.toString());
      return account;
      // You can also access other properties like account.id, account.email, etc.
    } else {
      print("Google Sign-In was canceled.");
      return null;
    }
  }

  static Future<dynamic> addtofavorite(int productId) async {
    try {
      Map data = {
        "data": {
          "userId": Myuser.id.toString(),
          "productId": productId.toString()
        }
      };
      print(data);
      String? auth = await Authontication.getData('auth');
      var res = await http.post(
          Uri.parse('http://localhost:3000/api/addtofavorite'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': auth!
          },
          body: json.encode(data));
      print(res.body);
    } catch (e) {}
  }

  static Future<dynamic> removefromfavorite(int productId) async {
    try {
      Map data = {
        "data": {
          "userId": Myuser.id.toString(),
          "productId": productId.toString()
        }
      };
      String? auth = await Authontication.getData('auth');
      var res = await http.post(
          Uri.parse('http://localhost:3000/api/removefromfavorite'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': auth!
          },
          body: json.encode(data));
    } catch (e) {}
  }

  static Future<bool> isProductInFavorites(int productId) async {
    try {
      String? auth = await Authontication.getData('auth');
      var res = await http.get(
          Uri.parse(
              "http://localhost:3000/api/isProductInFavorites/${Myuser.id}/${productId}"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': auth!
          });

      return jsonDecode(res.body);
    } catch (e) {
      return false;
    }
  }

  static Future<List<FavoritProduct>> getFavoriteproduct() async {
    try {
      String? auth = await Authontication.getData('auth');
      var res = await http.get(
          Uri.parse('http://localhost:3000/api/getAllFavorites'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': auth!
          });
      if (res.statusCode == 200) {
        List<dynamic> data = jsonDecode(res.body);
        return (data.map((item) => FavoritProduct.fromJson(item)).toList());
      } else
        return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<void> uploadImageWithFormData(
    File imageFile,
    String username,
    String email,
    String password,
    String password2,
  ) async {
    // Replace 'YOUR_API_ENDPOINT' with the actual URL of your API
    final url = Uri.parse('http://localhost:3000/api/signup');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add the image file to the request
    var image = await http.MultipartFile.fromPath('image', imageFile.path);
    request.files.add(image);

    // Add form data to the request
    request.fields['username'] = username;
    request.fields['email'] = email;
    request.fields['password'] = password;
    // request.fields['password2'] = password2;

    // Send the request
    var response = await request.send();
    print(response.stream);
    if (response.statusCode == 200) {
    String responseBody = await response.stream.bytesToString();
    Authontication.storeData('auth',responseBody);
    Authontication.storeData('auth',responseBody);
      print('Image and form data uploaded successfully');
    } else {
      print('Image and form data upload failed');
    }
  }
}
