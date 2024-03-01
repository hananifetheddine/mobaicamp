class Car {
  String mat;
  String brand;

  Car(this.mat, this.brand);

  static Car fromJson(Map<String, dynamic> data) {
    return Car(data["matricule"], data["brand"]);
  }
}
