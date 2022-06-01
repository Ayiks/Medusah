import 'package:get/get.dart';
import 'package:medusah/views/dashboard.dart';
import 'package:medusah/views/stocks/product_detail.dart';

import '../views/stocks/quantity_update_page.dart';

class RouteHelper {
  static const String initial ='/';
  static const String productPage = '/product-page';
  static const String quantityUpdatePage = '/quantity-page';


  static String getInitial() => '$initial';
  static String getProduct(int pageId, String page) => '$productPage?pageId=$pageId&page=$page';
  static String getQuantityUpdate(int pageId, String page) => '$quantityUpdatePage?pageId=$pageId&page=$page';


  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> DashboardView()),
    GetPage(name: productPage, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return ProductDetail(pageId: int.parse(pageId!), page: page!);
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: quantityUpdatePage, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return QuantityUpdatePage(pageId: int.parse(pageId!), page: page!);
    },
        transition: Transition.fadeIn
    ),

  ];
}