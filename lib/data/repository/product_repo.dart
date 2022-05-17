import 'package:get/get.dart';
import 'package:medusah/data/api/api_client.dart';
import 'package:medusah/utils/app_constants.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstants.PRODUCT_URI);
  }
}