import 'categoreys.dart';

class cart {
	int? id;
	int? userId;
	int? productId;
	int? quantity;
	Products? product;

	cart({this.id, this.userId, this.productId, this.quantity, this.product});

	cart.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		userId = json['userId'];
		productId = json['productId'];
		quantity = json['quantity'];
		product = json['product'] != null ? new Products.fromJson(json['product']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['userId'] = this.userId;
		data['productId'] = this.productId;
		data['quantity'] = this.quantity;
		if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
		return data;
	}
}

