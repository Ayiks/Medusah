import 'package:medusah/model/products_model.dart';

class CartModel {
  int? pId;
  String? id;
  String? name;
  double? price;
  int? quantity;
  bool? isExit;
  String? time;
  ProductModel? product;

  CartModel(
      {
        this.pId,
        this.id,
        this.name,
        this.price,
        this.quantity,
        this.isExit,
        this.time,
        this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    isExit = json['isExit'];
    time = json['time'];
    product=ProductModel.fromJson(json['product']);
  }
}
