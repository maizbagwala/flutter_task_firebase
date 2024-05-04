//user class model id, name ,email, password

class User {
  int? id;
  String? name;
  String? email;
  String? password;

  User({this.id, this.name, this.email, this.password});

  User.fromMap(Map<String, dynamic> map) {
    id = map['_id'];
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      '_id': id,
      'name': name,
      'email': email,
      'password': password
    };
    return map;
  }
}