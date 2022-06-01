class Product {
  int? _totalItems;
  bool? _status;
  String? _message;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product({required totalItems,
    required status, required message, required products}){
    this._totalItems = totalItems;
    this._products = products;
    this._message = message;
    this._products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalItems = json['total_items'];
    _status = json['status'];
    _message = json['message'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        products.add(ProductModel.fromJson(v));
      });
    }
  }

}

class ProductModel {
  String? id;
  String? name;
  String? category;
  double? costPrice;
  double? sellingPrice;
  int? quantity;
  int? iV;
  String? createdAt;
  String? updatedAt;
  int? pId;

  ProductModel(
      {this.id,
        this.name,
        this.category,
        this.costPrice,
        this.sellingPrice,
        this.quantity,
        this.iV,
        this.createdAt,
        this.updatedAt,
        this.pId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    category = json['category'];
    costPrice = double.parse("${json['costPrice']}");
    sellingPrice = double.parse("${json['sellingPrice']}");
    quantity = json['quantity'];
    iV = json['__v'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pId = json['productId'];
  }

  Map<String, dynamic> toJson(){
    return {
      "id": this.id,
      "name":this.name,
      "category": this.category,
      "sellingPrice": this.sellingPrice,
      "costPrice": this.costPrice,
      "quantity": this.quantity,
      "createdAt": this.createdAt,
      "updatedAt": this.updatedAt,
      "productId":this.pId
    };
  }
}