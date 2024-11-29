class User {
  String? name;
  String? username;
  String? email;
  String? phone;
  String? token;
  DateTime? created_at;
  DateTime? updated_at;


  User(
      {this.name, this.username, this.email, this.phone,this.token,this.created_at,this.updated_at});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
    created_at = DateTime.parse(json['created_at']);
    updated_at = DateTime.parse(json['updated_at']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['token'] = this.token;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    return data;
  }
}
