// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

List<Product> getProductListFromMap(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

String productListToMap(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Product {
  Product({
    this.name,
    this.active,
    this.id,
  });

  String name;
  bool active;
  int id;

  Product copyWith({
    String name,
    bool active,
    int id,
  }) =>
      Product(
        name: name ?? this.name,
        active: active ?? this.active,
        id: id ?? this.id,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    name: json["name"],
    active: json["active"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "active": active,
    "id": id,
  };

  @override
  String toString(){
    return this.toMap().toString();
  }
}
