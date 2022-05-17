import 'package:get/get.dart';
import 'package:medusah/controllers/cart_controller.dart';
import 'package:medusah/controllers/product_controller.dart';
import 'package:medusah/data/api/api_client.dart';
import 'package:medusah/data/repository/cart_repo.dart';
import 'package:medusah/data/repository/product_repo.dart';
import 'package:medusah/utils/app_constants.dart';

Future<void> init() async {
  //LOAD THE APICLIENT
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //LOAD REPOSITORY
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //LOAD CONTROLLERS
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}