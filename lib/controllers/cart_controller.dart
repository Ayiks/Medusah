import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusah/data/repository/cart_repo.dart';
import 'package:medusah/model/cart_model.dart';

import '../model/products_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity){
    var totalQuantity = 0;
    if(_items.containsKey(product.pId!)){
      _items.update(product.pId!, (value){
          totalQuantity = value.quantity! + quantity;
          return CartModel(
            pId: value.pId,
            id: value.id,
            name: value.name,
            sellingPrice: value.sellingPrice,
            quantity: value.quantity! + quantity,
            isExit: true,
            time: DateTime.now().toString(),
            product: product
          );
      });
      if (totalQuantity < 0) {
        _items.remove(product.pId);
      }
    }
    else {

      if (quantity >= 0) {
        _items.putIfAbsent(product.pId!, () {
          return CartModel(
              pId: product.pId,
              id: product.id,
              name: product.name,
              sellingPrice: product.sellingPrice,
              quantity: quantity,
              isExit: true,
              time: DateTime.now().toString(),
              product: product
          );
        });
      } else {
        Get.snackbar('Item Count', 'Add at least 1 item',
        backgroundColor: Colors.orange, colorText: Colors.white );
      }
    }
    update();
  }

  bool existInCart(ProductModel product) {
    if(_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }
  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  double get totalAmount{
    var total = 0.0;

    _items.forEach((key, value) {
      total += value.quantity! * value.sellingPrice!;
    });
    return total;
  }
}
