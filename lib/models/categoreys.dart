class Category {
  int? id;
  String? name;
  String? icon;
  List<Products>? products;

  Category({this.id, this.name, this.icon, this.products});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  int? categoryId;
  double? price;
  List<String>? colors;
  String? image;
  List<String>? imagePath;
  List<String>? modelPath;

  Products(
      {this.id,
      this.name,
      this.categoryId,
      this.price,
      this.colors,
      this.image,
      this.imagePath,
      this.modelPath});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['categoryId'];
    price = double.parse( json['price'].toString());
    colors = json['colors'].cast<String>();
    image = json['image'].toString();
    imagePath = json['imagePath'].cast<String>();
    modelPath = json['modelPath'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['categoryId'] = this.categoryId;
    data['price'] = this.price;
    data['colors'] = this.colors;
    data['image'] = this.image;
    data['imagePath'] = this.imagePath;
    data['modelPath'] = this.modelPath;
    return data;
  }
}