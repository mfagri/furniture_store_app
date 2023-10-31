class user {
  int? id;
  String? username;
  String? image;
  String? email;
  String? password;

  user({this.id, this.username, this.image, this.email, this.password});

  user.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    image = json['image'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['image'] = this.image;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}