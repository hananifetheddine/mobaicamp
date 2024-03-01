class User {
  String name;
  int age;

  User(this.name, this.age);

  Map<String, dynamic> toJson() {
    return {"name": name, "lastName": age};
  }
}
