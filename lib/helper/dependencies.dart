import 'package:get/get.dart';
import 'package:medusah/controllers/cart_controller.dart';
import 'package:medusah/controllers/product_controller.dart';
import 'package:medusah/data/api/api_client.dart';
import 'package:medusah/data/repository/cart_repo.dart';
import 'package:medusah/data/repository/product_repo.dart';
import 'package:medusah/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  
  //LOAD THE APICLIENT
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //LOAD REPOSITORY
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //LOAD CONTROLLERS
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}