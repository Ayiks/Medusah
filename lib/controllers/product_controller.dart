
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusah/data/repository/product_repo.dart';
import 'package:medusah/model/cart_model.dart';

import '../model/products_model.dart';
import 'cart_controller.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;
  ProductController({required this.productRepo});

  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;
  //Map<dynamic, ProductModel> item ={};


  Future<void> getProductList() async {
    Response response = await productRepo.getProductList();
    if (response.statusCode == 200) {
      print('got products');
      _productList = [];
      _productList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print('Failed to get products');
    }
  }

  Future<void> postProduct({
    required String productName,
    required String category,
    required double sellingPrice,
    required double costPrice,
    required int quantity
  }) async {
    Response response = await productRepo.postProduct({
    "name":productName,
    "category":category,
    "costPrice":costPrice,
    "sellingPrice":sellingPrice,
    "quantity":quantity
    });
    if(response.statusCode == 200){
      print('Product created');
      Get.snackbar('Success', 'Product Created successfully!',
          backgroundColor: Colors.orange, colorText: Colors.white);
      update();
    }else {
      print('Product not created');
      Get.snackbar('Error', 'Product Created successfully!',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_inCartItem + quantity < 0) {
      Get.snackbar('Item Count', 'can\'t be below zero',
          backgroundColor: Colors.orange, colorText: Colors.white);
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItem = _cart.getQuantity(product);
    }
    print('the quantity in the cart is ' + _inCartItem.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print('the id is ' +
          value.id.toString() +
          " The quantity is " +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
