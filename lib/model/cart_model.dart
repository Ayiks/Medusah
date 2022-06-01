import 'package:medusah/model/products_model.dart';

class CartModel {
  int? pId;
  String? id;
  String? name;
  double? sellingPrice;
  int? quantity;
  bool? isExit;
  String? time;
  ProductModel? product;

  CartModel(
      {
        this.pId,
        this.id,
        this.name,
        this.sellingPrice,
        this.quantity,
        this.isExit,
        this.time,
        this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sellingPrice = json['sellingPrice'];
    quantity = json['quantity'];
    isExit = json['isExit'];
    time = json['time'];
    product=ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson(){
    return {
      "id": this.id,
      "name":this.name,
      "sellingPrice": this.sellingPrice,
      "quantity": this.quantity,
      "isExist": this.isExit,
      "time":this.time,
      "product": this.product!.toJson()
    };
  }
}
