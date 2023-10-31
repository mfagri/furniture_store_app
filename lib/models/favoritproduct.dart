import 'package:chairsapp/models/categoreys.dart';

class FavoritProduct {
	int? id;
	int? userId;
	int? productId;
	Products? product;

	FavoritProduct({this.id, this.userId, this.productId, this.product});

	FavoritProduct.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		userId = json['userId'];
		productId = json['productId'];
		product = json['product'] != null ? new Products.fromJson(json['product']) : null;
	}
	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['userId'] = this.userId;
		data['productId'] = this.productId;
		if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
		return data;
	}
}

