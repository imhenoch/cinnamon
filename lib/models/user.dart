class User {
  final int id;
  final String email;
  final String token;

  User({this.id, this.email, this.token});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json["email"],
      token: json["token"]
    );
  }
}