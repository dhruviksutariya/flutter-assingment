class AllUser {
  String id;
  String fName;
  String lName;
  String email;
  String password;
  int createdAt;


  AllUser(
      {required this.id,
      required this.fName,
      required this.lName,
      required this.email,
      required this.password,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'fName': this.fName,
      'lName': this.lName,
      'email': this.email,
      'password': this.password,
      'createdAt': this.createdAt,
    };
  }

  factory AllUser.fromMap(Map<dynamic, dynamic> map) {
    return AllUser(
      id: map['id'] as String,
      fName: map['fName'] as String,
      lName: map['lName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      createdAt: map['createdAt'] as int,
    );
  }
}
